//
//  ToDoNoArchivedView.swift
//  Modelos-MVVM
//
//  Created by José Conejero Sivó on 6/12/25.
//

import SwiftUI

struct ToDoNoArchivedView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 8) {
            Text ("No hay notas archivadas")
                .font(.title2)
            
            Button {
                dismiss()
            } label: {
                Text("Ver todas las notas")
                    .font(.headline)
                    .foregroundStyle(Color.teal)
            }
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: 200)
    }
}

struct ToDoNoArchivedView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoNoArchivedView()
    }
}
