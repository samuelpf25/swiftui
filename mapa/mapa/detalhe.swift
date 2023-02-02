//
//  detalhe.swift
//  mapa
//
//  Created by Student23 on 27/01/23.
//

import SwiftUI
import MapKit

struct detalhe: View {
    var dado: Book
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        VStack{
            Text(dado.nomelocal)
                .font(.title)
                .foregroundColor(Color("prussian"))
                .fontWeight(.bold)
            
            //Spacer()
            
            Map(coordinateRegion: $region,
                interactionModes: MapInteractionModes.all,
                annotationItems: [dado],
                annotationContent: { dado in
                  MapMarker(coordinate: CLLocationCoordinate2D(
                    latitude: CLLocationDegrees(Double(dado.latitude)!),
                    longitude: CLLocationDegrees(Double(dado.longitude)!)
                ), tint: .red)
                })
                .frame(width: 300, height: 300).onAppear(
                ).onAppear{
                    region = MKCoordinateRegion(
                        center: CLLocationCoordinate2D(
                            latitude: CLLocationDegrees(Double(dado.latitude)!),
                            longitude: CLLocationDegrees(Double(dado.longitude)!)
                        ),
                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                    )
                }
        }.padding(10).frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("charcoal"),Color("crayola"), Color("iceberg")]), startPoint: .top, endPoint: .bottom)
            )
    }
    


}

