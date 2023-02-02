//
//  ContentView.swift
//  primeiroProjeto
//
//  Created by Student23 on 18/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State var texto = "Atualizar"
    
    var body: some View {
        VStack {
            Text(texto)
                .fontWeight(.bold)
                .font(.title2)
                .foregroundColor(Color.blue)
            Image("huckatruck")
                .resizable()
                .frame(width: 350, height: 300)
                .clipShape(Circle())
                .border(Color(white: 100))
            //Spacer()
            Text("HackaTruck")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
            
            HStack{
                Text("Maker")
                    .font(.subheadline)
                    .foregroundColor(Color.yellow)
                    .fontWeight(.medium)
                Text("Space")
                    .font(.subheadline)
                    .foregroundColor(Color.red)
                    .fontWeight(.medium)
            }
            TextField(
                    "Campo de texto",
                    text: $username
                )
            .padding(10)
            .textInputAutocapitalization(.characters)
                .disableAutocorrection(true)
                .border(.secondary)
            Button(action: {self.texto = username}) {
                    Text("Adicionar Texto")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                }
            .padding(15)
            .background(Color.blue) // If you have this
            .cornerRadius(15)
            
            
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
