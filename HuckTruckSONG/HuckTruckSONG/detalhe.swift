//
//  detalhe.swift
//  HuckTruckSONG
//
//  Created by Student23 on 26/01/23.
//

import SwiftUI
import AVKit

struct detalhe: View {
    @State var music: Book
    @State var audioPlayer: AVAudioPlayer!
    let url =  "https://s3.amazonaws.com/kargopolov/kukushka.mp3"
    @State var estado = true
    
    var body: some View {
        VStack{
            Spacer()
            AsyncImage(url: URL(string: music.str_url),content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 300, maxHeight: 300)
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
            HStack{
                Image(systemName: "shuffle").colorInvert().padding(5)
                Image(systemName: "backward.end.fill").colorInvert().padding(5)
                Image(systemName: (estado ? "play.fill" : "pause.fill")).colorInvert().padding(5).onTapGesture {
                    let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
                    self.audioPlayer =  try! AVAudioPlayer(contentsOf: URL(fileURLWithPath:sound!)) //URL(fileURLWithPath:sound!)
                    if (estado){ self.audioPlayer.play()}else{self.audioPlayer.pause()}
                    estado.toggle()
                    
                    
                }
                Image(systemName: "forward.end.fill").colorInvert().padding(5)
                Image(systemName: "repeat").colorInvert().padding(5) //play forward backward
            }.font(.title)
                .onAppear {
                    //let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
                    //self.audioPlayer =  try! AVAudioPlayer(contentsOf: URL(fileURLWithPath:sound!)) //fileURLWithPath: sound!
                        }
            Spacer()
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [.blue,.black, .black]), startPoint: .top, endPoint: .bottom)
            )
    }
}

/*struct detalhe_Previews: PreviewProvider {
    static var previews: some View {
        detalhe()
    }
}*/
