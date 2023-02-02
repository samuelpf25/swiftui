//
//  ContentView.swift
//  HuckTruckSONG
//
//  Created by Student23 on 26/01/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    //-10.209373215868537, -48.32286096559281
    @State var dados = [Book]()
    @State var navegar = false
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -10.209373215868537, longitude: -48.32286096559281), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        NavigationView{
            VStack {//VStack - 1
                
                
                Map(coordinateRegion: $region)
                    .frame(width: 350, height: 300).onAppear(
                    )
                VStack{//VStack - 2
                    HStack{//HStack - 1
                        Text("HackaMap")
                            .font(.title)
                            .foregroundColor(Color("prussian"))
                            .fontWeight(.bold)
                        
                        Spacer()
                    }//HStack - 1
                    HStack{//HStack - 2
                        Text("Selecione o local abaixo")
                            .font(.subheadline)
                            .foregroundColor(Color("prussian"))
                        Spacer()
                    }//HStack - 2
                    
                }.padding(20) //VStack - 2
                
                
                //NavigationView{
                ScrollView{
                    VStack{//VStack - 3
                        ForEach(dados,id: \._id){dado in
                            NavigationLink{detalhe(dado: dado)}label:{
                                HStack{//HStack - 3
                                    
    
                                    VStack(alignment: .leading){
                                        Text(dado.nomelocal)
                                            .foregroundColor(Color("prussian"))
                                            .font(.system(size: 17))
                                            .fontWeight(.heavy)
                                    }
                                    Spacer()
                                    Image(systemName: "ellipsis").accentColor(Color("prussian"))
                                    
                                }//HStack - 3
                                .frame(maxWidth: .infinity)
                                .padding(20)
                                
                            }//label NavigationLink
                        }//ForEach
                    }//VStack - 3
                }.onAppear(){
                    Api().loadData { (dados) in
                        self.dados = dados
                        
                    }
                }//ScrollView
                Spacer()
                //}//NavigationView

                
                
            } //VStack - 1
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("charcoal"),Color("crayola"), Color("iceberg")]), startPoint: .top, endPoint: .bottom)
            )
            
        }//NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
