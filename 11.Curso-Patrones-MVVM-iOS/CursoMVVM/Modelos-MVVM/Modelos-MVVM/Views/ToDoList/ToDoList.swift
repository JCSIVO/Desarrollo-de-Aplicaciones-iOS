//
//  ToDoList.swift
//  CursoMVVMSwift
//
//  Created by José Conejero Sivó on 30/11/25.
//

import SwiftUI

public struct ToDoList: View {
    @EnvironmentObject var viewModel: ToDoViewModel
    @State private var showedSheet = false
    @State private var todoToPreview: ToDoEntity?
    
    private var unArchivedToDos: [ToDoEntity] {
        viewModel.todos.filter { !$0.isArchived }
    }
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    public var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                if !unArchivedToDos.isEmpty {
                    LazyVGrid(
                        columns: columns, spacing: 8
                    ) {
                        ForEach(unArchivedToDos) { todo in ToDoItemView(todo: todo)
                                .onTapGesture {
                                    todoToPreview = todo
                                }
                        }
                    }
                    .padding(.horizontal)
                } else {
                    NoToDosView(showedCreationSheet: $showedSheet)
                        .offset(y: UIScreen.main.bounds.height * 0.3)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                if showedSheet {
                    ToDoSheet(isShow: $showedSheet) {
                        ToDoAddView(showed: $showedSheet)
                    }
                    .ignoresSafeArea(.keyboard)
                } else if todoToPreview != nil {
                    ToDoPreviewView(todo: $todoToPreview)
                        .transition(AnyTransition.opacity.animation(.easeIn))
                }
                
            }
        }
        .navigationTitle("ToDos")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 0) {
                    NavigationLink {
                        ToDoArchivedListView()
                    } label: {
                        Image(systemName: "trash")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color.primary)
                    }
                    Button {
                        showedSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(Color.primary)
                    }
                }
            }
        }
        .navigationBarHidden(showedSheet || (todoToPreview != nil) )
    }
    
}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ToDoList()
        }
    }
}
