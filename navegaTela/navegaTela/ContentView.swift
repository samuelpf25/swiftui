//
//  ContentView.swift
//  navegaTela
//
//  Created by Student23 on 20/01/23.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        UITabBar.appearance()
            .backgroundColor = UIColor.gray
    }
    
    var body: some View {
        TabView{
            Blue()
                .tabItem{
                    Label("Blue", systemImage: "pencil.and.ellipsis.rectangle")
                }
            Red()
                .tabItem{
                    Label("Red", systemImage: "pencil.and.outline")
                }
            Yellow()
                .tabItem{
                    Label("Yellow", systemImage: "pencil")
                }
        }
        .accentColor(Color.black)
        .toolbarColorScheme(.light, for: .tabBar)
        
        //.backgroundStyle(.green)
        //.tabViewStyle(.automatic)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
