//
//  AlbumSongCell.swift
//  Musica
//
//  Created by Miguel on 5/12/22.
//

import SwiftUI
import MediaPlayer

struct AlbumSongCell: View {
    
    let item: MPMediaItem
    
    init(_ item: MPMediaItem) {
        self.item = item
    }
    
    var body: some View {
        
        Button(action: {
            let predicate = MPMediaPropertyPredicate(value: self.item.persistentID, forProperty: MPMediaItemPropertyPersistentID)
            let query = MPMediaQuery(filterPredicates: [predicate])
            let descriptor = MPMusicPlayerMediaItemQueueDescriptor(query: query)
            MPMusicPlayerController.systemMusicPlayer.setQueue(with: descriptor)
            MPMusicPlayerController.systemMusicPlayer.play()
        }) {
            HStack() {
                Text("\(self.item.albumTrackNumber ?? 1)")
                    .frame(width: 20)
                    .opacity(0.4)
                    .padding(.horizontal, 5)
                Text(self.item.title ?? "-")
                Spacer()
                Text(self.item.playbackDuration.stringFromTimeInterval())
                    .opacity(0.4)
                    .padding(.horizontal, 5)
            }}
        .frame(
            minHeight: 37,
            maxHeight: 37,
            alignment: .leading
        )
    }
}
