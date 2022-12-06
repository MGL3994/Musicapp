//
//  NowPlayingBarView.swift
//  Musica
//
//  Created by Miguel on 4/12/22.
//

import SwiftUI
import MediaPlayer


struct NowPlayingBarView: View {
    
    @EnvironmentObject var model: Model
    
    var body: some View {
        
        let nowPlayingSong = model.playingSong
        
        
        VStack(spacing: 0) {
            
            Divider()
            
            HStack{
                
                Image(uiImage: nowPlayingSong?.artwork?.image(at: CGSize(width: 50, height: 50)) ?? UIImage(named: "Cover") ?? UIImage())
                    .resizable()
                    .frame(width: 50, height: 50)
                    //.cornerRadius(5)
                //.shadow(radius: 3)
                
                Text(nowPlayingSong?.title ?? "Nada suena")
                
                Spacer()
                
                /*Image(systemName: "play.fill")
                 .font(.title)
                 
                 Image(systemName: "forward.fill")
                 .font(.title)
                 .padding(.horizontal, 15)*/
            }
            .background(.ultraThinMaterial).clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.vertical, 10)
            .padding(.horizontal, 20)

            //
        }
        .background(Blur())
        .onTapGesture {
            withAnimation(.default) {
                model.isPlayerOpen.toggle()
            }
        }
    }
}


struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemChromeMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
