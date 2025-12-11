//
//  PopularShowsViewModel.swift
//  Curso-Clean-Architecture
//
//  Created by José Conejero Sivó on 8/12/25.
//

import Foundation

final class PopularShowsViewModel: ObservableObject {
    @Published var shows: [TVShow] = []
    
    private let getPopularTVShowsUseCase: GetPopularTVShowsUseCaseProtocol
    
    init(getPopularTVShowsUseCase: GetPopularTVShowsUseCaseProtocol = GetPopularTVShowUseCase()) {
        self.getPopularTVShowsUseCase = getPopularTVShowsUseCase
    }
    func loadPopularShows(){
        Task {
            do {
                let shows = try await getPopularTVShowsUseCase.excecute()
                await MainActor.run {
                    self.shows = shows
                }
            } catch {
                print(error)
            }
        }
    }
}
