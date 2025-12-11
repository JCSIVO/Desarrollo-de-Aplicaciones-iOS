//
//  ToDoAddView.swift
//  CursoMVVMSwift
//
//  Created by José Conejero Sivó on 30/11/25.
//

import SwiftUI

public struct ToDoAddView: View {
   @EnvironmentObject var viewModel: ToDoViewModel
    @Binding var showed: Bool
    
    @State private var title = ""
    @State private var note = ""
    @State private var date = Date()
    
    public var todo: ToDoEntity? = nil
    
    private let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startDate = Date.now
        let endDate = calendar.date(
            byAdding: .year,
            value: 10,
            to: startDate
        ) ?? startDate
        return startDate...endDate
    }()
    
    var isSaveDisabled: Bool {
        !viewModel.validateInput(ofText: title)
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            
            ToDoTextInput(
                "Ingrese nombre tarea",
                text: $title,
                label: "Tarea"
            )
            
            ToDoTextInput (
                "(Opcional) Escriba la descripción de la tarea",
                text: $note,
                label: "Nota"
            )
            DatePicker (
                selection: $date,
                in: dateRange
            ) {
                Text("Fecha y Hora")
                    .font(.title3)
            }
            .tint(Color.primary)
            .padding(.vertical, 8)
            
            Spacer()
            
            Button {
                if let todo = todo {
                    viewModel.updateToDo(todo, withNewTitle: title, note: note, date: date)
                } else {
                    viewModel.addToDo(withTitle: title, note: note, date: date)
                }
                showed.toggle()
                
            } label: {
                Text("Guardar".uppercased())
                    .font(.headline)
                    .tint(Color.primary)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isSaveDisabled ? Color(UIColor.systemGray5) : Color.teal)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .disabled(isSaveDisabled)
        }
        .onAppear {
            if let todo = todo {
                title = todo.title!
                note = todo.note ?? ""
                date = todo.date!
            }
        }
    }
    
}

struct ToDoAddView_Previews: PreviewProvider {
    @State static var showed = false
    static var previews: some View {
        ToDoAddView(showed: $showed)
                    .environmentObject(ToDoViewModel())
    }
}
