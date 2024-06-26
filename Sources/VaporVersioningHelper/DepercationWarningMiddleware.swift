import Vapor

public struct DepercationWarningMiddleware: AsyncMiddleware {
    private let depercatedSince: Date
    private let link: String? = nil

    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        let response = try await next.respond(to: request)
        response.headers.add(name: "Depercation", value: "@\(depercatedSince.timeIntervalSince1970)")
        if let depercationLink = link {
            response.headers.add(name: "Link", value: "<\(depercationLink)>; rel=\"depercation\"")
        }
        return response
    }
}
