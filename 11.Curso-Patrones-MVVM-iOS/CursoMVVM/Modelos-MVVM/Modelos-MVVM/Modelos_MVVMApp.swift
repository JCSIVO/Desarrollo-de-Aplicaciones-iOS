//
//  Modelos_MVVMApp.swift
//  Modelos-MVVM
//
//  Created by José Conejero Sivó on 30/11/25.
//

import SwiftUI

@main
struct Modelos_MVVMApp: App {
    @StateObject private var viewModel: ToDoViewModel = ToDoViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
