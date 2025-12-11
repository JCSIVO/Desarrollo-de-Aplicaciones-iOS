//
//  TVShow.swift
//  Curso-Clean-Architecture
//
//  Created by José Conejero Sivó on 7/12/25.
//

import Foundation

struct PopularShowResponse: Codable {
    let results: [TVShow]
}

struct TVShow: Codable {
    let id: Int
    let name: String
    let first_air_date: String
    let vote_average: Double
}
