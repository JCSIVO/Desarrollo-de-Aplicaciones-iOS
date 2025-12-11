//
//  GetPopularTVShowsUseCaseProtocol.swift
//  Curso-Clean-Architecture
//
//  Created by José Conejero Sivó on 8/12/25.
//

import Foundation

protocol GetPopularTVShowsUseCaseProtocol {
    func excecute() async throws -> [TVShow]
}

final class GetPopularTVShowUseCase: GetPopularTVShowsUseCaseProtocol {
    private let repository: TvShowRepository
    
    init(repository: TvShowRepository = TvShowRepositoryImpl()) {
        self.repository = repository
    }
    func excecute() async throws -> [TVShow] {
        try await repository.fetchPopularTVShows()
    }
}
