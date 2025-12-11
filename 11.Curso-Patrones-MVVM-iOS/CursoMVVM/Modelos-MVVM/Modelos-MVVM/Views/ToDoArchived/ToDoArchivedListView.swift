//
//  ToDoArchivedListView.swift
//  CursoMVVMSwift
//
//  Created by José Conejero Sivó on 30/11/25.
//

import SwiftUI

public struct ToDoArchivedListView: View {
    @EnvironmentObject var viewModel: ToDoViewModel
    
    private var archiveTodos: [ToDoEntity] {
        viewModel.todos.filter { $0.isArchived }
    }
    
    public var body: some View {
        ScrollView {
            if !archiveTodos.isEmpty {
                ForEach(archiveTodos) { todo in
                    ZStack {
                        ToDoArchivedItemView(todo: todo)
                    }
                    .padding(.horizontal)
                }
            } else {
               ToDoNoArchivedView()
                    .offset(y:UIScreen.main.bounds.height * 0.35)
            }
        }
        .padding(.top, 16)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Archivadas")
    }
    
}

struct ToDoArchivedListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoArchivedListView()
    }
}
