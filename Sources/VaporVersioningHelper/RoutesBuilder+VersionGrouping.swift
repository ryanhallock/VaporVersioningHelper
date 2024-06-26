import Vapor

typealias Version = String

public final class VersioningGroup: RoutesBuilder {
    fileprivate let root: RoutesBuilder // We keep this arround to find the parent.
    let groupedRoot: RoutesBuilder
    let version: Version

    // We will keep track of all routes underus.
    private var routes: [Route] = []

    init(root: RoutesBuilder, version: Version) {
        self.root = root
        self.groupedRoot = root.grouped(PathComponent(stringLiteral: version))
        self.version = version
    }

    private convenience init(existing: VersioningGroup, version: Version) {
        self.init(root: existing.root, version: version)

        for existingRoute in existing.routes {
            self.add(existingRoute)
        } // Prepending all our existing routes. Vapor handles duplicates but does warn the user.
    }

    public func add(_ route: Route) {
        // Create a copy before the root node path is appended.
        let copiedRoute = Route(method: route.method, path: route.path, responder: route.responder, requestType: route.requestType, responseType: route.responseType)
        self.routes.append(copiedRoute)

        self.groupedRoot.add(route) // Default behavior
    }

    func upgraded(to version: Version) -> VersioningGroup {
        return VersioningGroup(existing: self, version: version)
    }

    func upgrade(to version: Version, _ closure: (VersioningGroup) throws -> ()) rethrows {
        try closure(upgraded(to: version))
    }
}

extension RoutesBuilder {
    func versioned(_ version: Version) -> VersioningGroup {
        return VersioningGroup(root: self, version: version)
    }

    func version(_ version: Version, _ closure: (VersioningGroup) throws -> ()) rethrows {
        try closure(versioned(version))
    }
}
