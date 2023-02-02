//
//  ContentView.swift
//  calculaIMC
//
//  Created by Student23 on 19/01/23.
//

import SwiftUI

struct ContentView: View {
    //variaveis
    @State var cor: Color = Color.green
    @State var calc: Double = 0.0
    @State var indice: Int = 0
    @State var cores: [String] = ["baixopeso","normal","sobrepeso","obesidade"]
    
    
    @State var peso: Int?
    @State var pes: Double = 0.0
    @State var altura: Int?
    @State var alt: Double = 1.0
    @State var resultado: String = "NORMAL"
    
    
    
    var body: some View {
        ZStack{
            //Color(cores[indice])
            cor.ignoresSafeArea()
            VStack {
                Text("Calculadora de IMC")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(10)
                
                TextField("Peso em kg", value: $peso, format: .number)
                    .padding(10)
                    .background(Color.white)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .fontWeight(.bold)
                
                TextField("Altura em cm", value: $altura, format: .number)
                    .padding(10)
                    .background(Color.white)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Button(action: {
                    alt = Double(altura!)/100
                    pes = Double(peso!)
                    calc = pes/(pow(alt,2))
                    
                    @State var texto: String = String(calc.formatted(.number.precision(.fractionLength(2))))
                    
                    if (calc < 18.5){
                        resultado = "Baixo Peso \(texto)"
                        indice = 0
                        
                    }else if (calc < 24.99){
                        resultado = "Normal \(texto)"
                        indice = 1
                        
                    }else if (calc < 29.99){
                        resultado = "Sobrepeso \(texto)"
                        indice = 2
                        
                    }else if (calc >= 30.0){
                        resultado = "Obeso \(texto)"
                        indice = 3
                        
                    }
                    
                    cor = Color(cores[indice])
                    //peso = nil
                    //altura = nil
                    
                    //resultado = String(calc)
                    
                }){
                    Text("Calcular")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                    
                }
                .padding(15)
                .background(Color.blue)
                .cornerRadius(15)
                .font(.title2)
                
                Spacer()
                
                Text(resultado)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                
                Spacer()
                Image("tabela")
                    .resizable()
                    .scaledToFit()
                //Text("Hello, world!")
            }
            .padding()
            //.background(Color(cores[indice])) // changeBkColor(color: indice)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
