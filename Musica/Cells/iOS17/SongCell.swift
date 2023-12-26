//
//  SongCell.swift
//  Musica
//
//  Created by Miguel on 3/12/22.
//

import SwiftUI
import MediaPlayer
import AVFoundation

struct SongCell: View {

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
            HStack() {
                Image(uiImage: song.artwork!.image(at: CGSize(width: 50, height: 50)) ?? UIImage(named: "Cover") ?? UIImage())
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(4)
                VStack(alignment: .leading) {
                    Text(song.title!)
                        .bold()
                    Text(song.artist ?? "Desconocido").font(.system(.callout)).opacity(0.4)
                }
                Spacer()
            }}
            .frame(
                minHeight: 37,
                maxHeight: 37,
                alignment: .leading
            )
    }
}
