import Vapor


public struct SunsetMiddleware: AsyncMiddleware {
    private let finalDate: Date

    enum SunsetMiddlewareError: Error {
        case finalDateReached(date: Date)
    }

    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        guard finalDate < Date() else {
            throw SunsetMiddlewareError.finalDateReached(date: finalDate)
        }

        let response = try await next.respond(to: request)
        response.headers.add(name: "Sunset", value: finalDate.rfc1123)
        return response
    }
}
