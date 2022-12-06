//
//  NowPlayingView.swift
//  Musica
//
//  Created by Miguel on 5/12/22.
//

import SwiftUI

struct NowPlayingView: View {
    
    @EnvironmentObject var model: Model
    @State var scroller: Double = 2
    @State var volume: Double = 2
    
    var body: some View {
        
        let nowPlayingSong = model.playingSong
        
        ZStack {
            VStack(spacing: 0) {
                Spacer()
                ZStack {
                    Image(uiImage: nowPlayingSong?.artwork?.image(at: CGSize(width: 250, height: 250)) ?? UIImage(named: "Cover") ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(15)
                        .padding(.horizontal, 30)
                        .shadow(radius: 20)
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text(nowPlayingSong?.title ?? "Nada suena")
                            .font(.title2)
                            .bold()
                        Text(nowPlayingSong?.artist ?? "Artista")
                            .bold()
                            .opacity(0.6)
                    }
                    .padding(.leading, 30)
                    .padding(.top, 20)
                    Spacer()
                }
                Slider(value: $scroller, in: 0...100)
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                HStack{
                    Spacer()
                    Image(systemName: "backward.fill")
                        .font(.largeTitle)
                    Spacer()
                    
                    
                    //if model.musicPlayer.playbackState == .paused || model.musicPlayer.playbackState == .stopped {
                    if model.isPlaying == false {
                        Image(systemName: "play.fill")
                            .font(.system(size: 50))
                            .onTapGesture {
                                // TODO: Handle empty queue
                                //withAnimation(.spring()) {
                                    model.isPlaying = true
                                    model.musicPlayer.play()
                                //}
                            }
                    } else {
                        Image(systemName: "pause.fill")
                            .font(.system(size: 50))
                            .onTapGesture {
                                //withAnimation(.spring()) {
                                //withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                                    model.isPlaying = false
                                    model.musicPlayer.pause()
                                //}
                            }
                    }
                    
                    Spacer()
                    
                    Image(systemName: "forward.fill")
                        .font(.largeTitle)
                    
                    Spacer()
                }
                
                HStack {
                    Image(systemName: "speaker.fill")
                        .foregroundColor(.secondary)
                        .font(.system(size: 12))
                    Slider(value: $volume, in: 0...100)
                    Image(systemName: "speaker.wave.3.fill")
                        .foregroundColor(.secondary)
                        .font(.system(size: 12))
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 30)
                
                HStack {
                    Spacer()
                    Image(systemName: "repeat")
                        .font(.system(size: 20))
                    Spacer()
                    Image(systemName: "airplayaudio")
                        .font(.system(size: 20))
                    Spacer()
                    Image(systemName: "list.bullet")
                        .font(.system(size: 20))
                    Spacer()
                }
                
                Spacer()
                
            }//
            .background(Blur())
            
        }.edgesIgnoringSafeArea(.all)
    }
}

