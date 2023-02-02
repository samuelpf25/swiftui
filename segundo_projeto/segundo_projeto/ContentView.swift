//
//  ContentView.swift
//  segundo_projeto
//
//  Created by Student23 on 19/01/23.
//

import SwiftUI

struct ContentView: View {
    //variaveis
    @State private var usuario: String = ""
    @State var texto = ""
    @State private var showingAlert = false
    
    
    //view
    var body: some View {
        VStack {
            Text("Bem vindo, " + usuario)
                .font(.title)
                .fontWeight(.bold)
            TextField("Digite seu nome", text: $texto)
                .padding(10)
                .textInputAutocapitalization(.characters)
                .disableAutocorrection(true)
                .multilineTextAlignment(.center)
            //.border(.secondary)
            Spacer()
            
            Image("logo")
                .resizable()
                .frame(width: 200, height: 100)
            Image("truck")
                .resizable()
                .frame(width: 300, height: 150)
                .padding(30)
            Spacer()
            
            Button(action: {
                
                self.usuario = texto
                self.showingAlert = true
                
            }) {
                Text("Entrar")
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                
            }
            .padding(15)
            //.background(Color.white) // If you have this
            .cornerRadius(15)
            .font(.title2)
            .alert("Voce irá iniciar o desafio da aula agora", isPresented: $showingAlert) {
                Button("Vamos lá!", role: .cancel) { }
            }
            
            
        }
        .padding()
        .background(
            Image("bg")
                .resizable()
                .scaledToFill()
            //.frame(width: 350, height: 350)
                .opacity(0.07)
            
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
