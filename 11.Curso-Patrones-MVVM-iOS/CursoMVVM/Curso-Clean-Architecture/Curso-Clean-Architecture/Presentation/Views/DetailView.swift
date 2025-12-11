//
//  DetailView.swift
//  Curso-Clean-Architecture
//
//  Created by José Conejero Sivó on 8/12/25.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel: TVShowDetailsViewModel
    
    init(viewModel: TVShowDetailsViewModel){
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            if let details = viewModel.details {
                Text(details.name)
                    .font(.headline)
                    .padding(.bottom, 20)
                Text(details.overview)
                if !details.genres.isEmpty {
                    Text("Generos")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                    ForEach(details.genres) { genre in Text(genre.name)
                        
                    }
                }
            } else {
                Text("Cargando...")
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .onAppear {
            Task {
               await viewModel.loadDetails(id: viewModel.showID)
            }
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        //DetailView()
    }
}
