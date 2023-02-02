//
//  ContentView.swift
//  consumindoAPI
//
//  Created by Student23 on 25/01/23.
//

import SwiftUI

struct ContentView: View {
    @State var dados = [Book]()
    
    var body: some View {
        
            
        
        List(dados){dado in LazyHStack{
            Text("\(dado.age)").padding(5)
            Text(dado.first_name).padding(5)
            Text(dado.ip_address).padding(5)
        }}.onAppear() {
            Api().loadData { (dados) in
                self.dados = dados
            }
        }.padding(10)
        
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
