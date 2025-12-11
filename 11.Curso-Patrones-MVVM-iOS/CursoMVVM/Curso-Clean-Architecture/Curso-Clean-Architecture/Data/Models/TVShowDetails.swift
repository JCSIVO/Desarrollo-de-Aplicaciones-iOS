//
//  TVShowDetails.swift
//  Curso-Clean-Architecture
//
//  Created by José Conejero Sivó on 7/12/25.
//

import Foundation

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}

struct TVShowDetails: Codable {
    let name: String
    let genres: [Genre]
    let overview: String
}
