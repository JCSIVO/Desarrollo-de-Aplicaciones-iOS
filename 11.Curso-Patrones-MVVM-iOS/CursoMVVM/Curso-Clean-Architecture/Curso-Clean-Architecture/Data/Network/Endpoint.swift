//
//  Endpoint.swift
//  Curso-Clean-Architecture
//
//  Created by José Conejero Sivó on 7/12/25.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum Endpoint {
    case popularShows
    case tvShowDetails(id: Int)
    
    var url: URL {
        let baseURL = "https://api.themoviedb.org/3"
        let apiKey = "c2a665c49a75f5cf47424caf5c70c8a0"
        
        switch self {
        case .popularShows:
            return URL(string: "\(baseURL)/tv/popular?api_key=\(apiKey)&language=es&page=1")!
        case .tvShowDetails(let id):
            return URL(string: "\(baseURL)/tv/\(id)?api_key=\(apiKey)&language=es_ES")!
        }
    }
    var method: HTTPMethod {
        return .get
    }
}
