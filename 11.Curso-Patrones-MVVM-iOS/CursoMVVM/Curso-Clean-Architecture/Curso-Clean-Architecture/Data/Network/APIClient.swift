//
//  APIClient.swift
//  Curso-Clean-Architecture
//
//  Created by José Conejero Sivó on 7/12/25.
//

import Foundation

final class APIClient {
    func request <T: Decodable>(endopoint: Endpoint) async throws -> T {
        var urlRequest = URLRequest(URL: endopoint.url)
        urlRequest.httpMethod = endopoint.method.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest)
        guard
            let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
