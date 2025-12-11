//
//  PopularShowsView.swift
//  Curso-Clean-Architecture
//
//  Created by José Conejero Sivó on 8/12/25.
//

import SwiftUI

struct PopularShowsView: View {
    @StateObject private var viewModel = PopularShowsViewModel()
    
    var body: some View {
        NavigationLink {
            List(viewModel.shows, id:\.id ) { show in
                NavigationLink(destination: DetailView(viewModel: TVShowDetailsViewModel(id: show.id))) {
                    Text(show.name)
                }
                
                
            }
            .onAppear {
                Task {
                    viewModel.loadPopularShows()
                }
            }
        }
    }
}

struct PopularShowsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularShowsView()
    }
}
