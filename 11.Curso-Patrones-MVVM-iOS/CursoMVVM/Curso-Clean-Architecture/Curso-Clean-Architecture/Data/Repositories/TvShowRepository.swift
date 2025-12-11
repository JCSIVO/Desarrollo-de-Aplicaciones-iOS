//
//  TvShowRepository.swift
//  Curso-Clean-Architecture
//
//  Created by José Conejero Sivó on 7/12/25.
//

import Foundation

protocol TvShowRepository {
    func fetchPopularTVShows() async throws -> [TVShow]
    func fetchTVShowDetails(id: Int) async throws -> TVShowDetails
}
