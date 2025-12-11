//
//  ContentView.swift
//  UserDefaultsExamples
//
//  Created by José Conejero Sivó on 8/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }*/
        //.padding()
        MainView(viewModel: MainViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


