//
//  GetTVShowsDetailsUseCaseProtocol.swift
//  Curso-Clean-Architecture
//
//  Created by José Conejero Sivó on 8/12/25.
//

import Foundation

protocol GetTVShowDetailsUseCaseProtocol {
    func execute(id: Int) async throws -> TVShowDetails
}

final class GetTVShowDetailsUseCase: GetTVShowDetailsUseCaseProtocol {
    private let repository: TvShowRepository
    
    init(repository: TvShowRepository = TvShowRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(id: Int) async throws -> TVShowDetails {
        try await repository.fetchTVShowDetails(id: id)
    }
}
