//
//  SongCell.swift
//  Musica
//
//  Created by Miguel on 3/12/22.
//

import SwiftUI
import MediaPlayer
import AVFoundation

struct iOS6SongCell: View {

    let song: MPMediaItem
    @EnvironmentObject var model: Model

    var body: some View {
        
        Button(action: {
            model.musicPlayer.setQueue(with: MPMediaItemCollection(items: [song]))
            model.musicPlayer.play()
            model.isPlaying = true
            model.playingSong = model.musicPlayer.nowPlayingItem
            model.isPlayerOpen.toggle()
        }) {
        ZStack {
            VStack {
                Rectangle()
                    .fill(Color(.white.withAlphaComponent(0.8)))
                    .frame(height: 1)
                Spacer()
                Rectangle()
                    .fill(Color(red: 185/255, green: 187/255, blue: 189/255))
                    .frame(height: 1)
            }
            
            ZStack {
                Text(song.title!)
                    //.foregroundColor(Color(red: 55/225, green: 55/225, blue: 55/225))
                    .font(Font.custom("Helvetica Neue", size: 20))
                    .fontWeight(.bold)
                    //.shadow(color: Color(UIColor.black.withAlphaComponent(0.2)), radius: 0, x: 0, y: -1)
                    //.shadow(color: Color(UIColor.white.withAlphaComponent(1.0)), radius: 0, x: 0, y: 1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
        }}
        .buttonStyle(iOS6ListBtn())
    }
}
