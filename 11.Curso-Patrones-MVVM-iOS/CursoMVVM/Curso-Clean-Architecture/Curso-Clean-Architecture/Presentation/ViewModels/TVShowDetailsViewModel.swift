//
//  TVShowDetailsViewModel.swift
//  Curso-Clean-Architecture
//
//  Created by José Conejero Sivó on 8/12/25.
//

import Foundation

final class TVShowDetailsViewModel: ObservableObject {
    @Published var details: TVShowDetails?
    var showID: Int = 0
    private let getTVShowDetailsUseCase: GetTVShowDetailsUseCaseProtocol
    
    init(id: Int, GetTVShowDetailsUseCase: GetTVShowDetailsUseCaseProtocol = GetTVShowDetailsUseCase()){
        self.showID = id
        self.getTVShowDetailsUseCase = GetTVShowDetailsUseCase
    }
    
    func loadDetails(id: Int) async {
        do {
            let details = try await getTVShowDetailsUseCase.execute(id: id)
            await MainActor.run {
                self.details = details
            }
        } catch {
            print(error)
        }
    }
}
