//
//  ContentView.swift
//  HuckTruckSONG
//
//  Created by Student23 on 26/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var musics = [Book]()
    @State var navegar = false
    
    var body: some View {
        NavigationView{
            VStack {//VStack - 1
                
                
                Image("truck")
                    .resizable()
                    .frame(width: 200, height: 100)
                VStack{//VStack - 2
                    HStack{//HStack - 1
                        Text("HackaFM")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }//HStack - 1
                    HStack{//HStack - 2
                        Text("HackaSong")
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                        Spacer()
                    }//HStack - 2
                    
                }.padding(20) //VStack - 2
                
                
                //NavigationView{
                ScrollView{
                    VStack{//VStack - 3
                        ForEach(musics,id: \._id){music in
                            NavigationLink{detalhe(music: music)}label:{
                                HStack{//HStack - 3
                                    
                                    AsyncImage(url: URL(string: music.str_url),content: { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 50, maxHeight: 50)
                                    },placeholder: {
                                        //put your placeholder here
                                    })
                                    VStack(alignment: .leading){
                                        Text(music.musica)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 17))
                                            .fontWeight(.heavy)
                                        Text(music.artista)
                                            .foregroundColor(Color.white)
                                            .font(.subheadline)
                                            .fontWeight(.medium)
                                    }
                                    Spacer()
                                    Image(systemName: "ellipsis").colorInvert()
                                    
                                }//HStack - 3
                                .frame(maxWidth: .infinity)
                                .padding(20)
                                
                            }//label NavigationLink
                        }//ForEach
                    }//VStack - 3
                }.onAppear(){
                    Api().loadData { (musics) in
                        self.musics = musics
                        
                    }
                }//ScrollView
                Spacer()
                //}//NavigationView
                VStack (alignment: .leading){
                    Text("Sugeridos")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                    //.multilineTextAlignment(.leading)
                }
                ScrollView(.horizontal){
                    HStack{
                        ForEach(musics,id: \._id){music in
                            //NavigationLink{detalhe(music: music)}label:{
                                VStack{//HStack - 3
                                    
                                    AsyncImage(url: URL(string: music.str_url),content: { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 100, maxHeight: 100)
                                    },placeholder: {
                                        //put your placeholder here
                                    })
                                    VStack(alignment: .leading){
                                        Text(music.musica)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 17))
                                            .fontWeight(.heavy)
                                        Text(music.artista)
                                            .foregroundColor(Color.white)
                                            .font(.subheadline)
                                            .fontWeight(.medium)
                                    }
                                    Spacer()
                                    
                                }//HStack - 3
                                .frame(maxHeight: 150)
                                .padding(20)
                                
                            //}//label NavigationLink
                        }//ForEach
                        
                    }
                    .frame(maxHeight: 150)
                }
                
            } //VStack - 1
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [.blue,.black, .black]), startPoint: .top, endPoint: .bottom)
            )
            
        }//NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
