//
//  TVShowRepositoryImpl.swift
//  Curso-Clean-Architecture
//
//  Created by José Conejero Sivó on 7/12/25.
//

import Foundation

final class TvShowRepositoryImpl: TvShowRepository {
    private let apiClient: APIClient
    
    init(apiClient: apiClient = APIClient()) {
        self.apiClient = apiClient
    }
    
    func fetchPopularTVShows() async throws -> [TVShow] {
        let response: PopularShowResponse = try await apiClient.request(endopoint: .popularShows)
        return response.results
    }
    
    func fetchTVShowDetails(id: Int) async throws -> TVShowDetails {
        try await apiClient.request(endopoint: .tvShowDetails(id: id))
    }
}
