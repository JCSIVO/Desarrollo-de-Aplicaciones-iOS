//
//  ContentView.swift
//  Aprendiendo-SwiftUI
//
//  Created by José Conejero Sivó on 29/11/25.
//

import SwiftUI

struct Settings {
    static let facebookColor = Color(red: 56/255, green: 87/255, blue: 163/255)
}



struct CustomTextField: View {
    @State var emailValue: String = ""
    var placeHolder: String = ""
    
    var body: some View {
        TextField(placeHolder, text: $emailValue)
            .padding(.all ,20)
            .foregroundColor(.black)
            .accentColor(.pink)
            .background(Color.white)
            .cornerRadius(25)
    }
}

struct ContentView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image("logo")
                    .resizable()
                    .frame(width: 250, height: 54)
                    .clipped()
                    .scaledToFill()
                
                Text("Inicia  sesión para continuar")
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                CustomTextField(placeHolder: "Email")
                
                CustomTextField(placeHolder: "PassWord")
                
                Button (action: {
                    // Acción a ejecutar
                }) {
                Text("Iniciar Sesion")
                        .fontWeight(.medium)
                        .padding(.all)
                        .background(Color.white.opacity(0.3))
                        .foregroundColor(Color.white)
                        .cornerRadius(25)
                }

            }
            .padding([.top, .leading, .trailing], 50)
        }
        .background(Settings.facebookColor)
        .edgesIgnoringSafeArea(Edge.Set.all)
        
    }
}

// No tocar, es solo para el preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
