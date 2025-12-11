//
//  ContentView.swift
//  Curso-Clean-Architecture
//
//  Created by José Conejero Sivó on 7/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            PopularShowsView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
