//
//  ContentView.swift
//  Modelos-MVVM
//
//  Created by José Conejero Sivó on 30/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ToDoList()
        }
        .tint(Color.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
