//
//  NoToDosView.swift
//  Modelos-MVVM
//
//  Created by José Conejero Sivó on 6/12/25.
//

import SwiftUI

struct NoToDosView: View {
    @Binding var showedCreationSheet: Bool
    
    var body: some View {
        VStack(spacing: 8 ) {
            Text("No hay tareas aún.")
                .font(.title2)
            Button {
                showedCreationSheet.toggle()
            } label: {
                Text("Intenta crear una tarea.")
                    .font(.headline)
                    .foregroundStyle(Color.teal)
            }
        }
    }
}

struct NoToDosView_Previews: PreviewProvider {
    static var previews: some View {
        NoToDosView(
            showedCreationSheet: .constant(false)
        )
    }
}
