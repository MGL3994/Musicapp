//
//  iOS6AlbumSongCell.swift
//  Musica
//
//  Created by Miguel on 17/12/23.
//

import SwiftUI
import MediaPlayer

struct iOS6AlbumSongCell: View {
    
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
                
                HStack {
                    Text("\(self.item.albumTrackNumber ?? 1)")
                        .frame(width: 20)
                        .opacity(0.4)
                        .padding(.horizontal, 5)
                        .font(Font.custom("Helvetica Neue", size: 20))
                        .fontWeight(.bold)
                    Text(self.item.title ?? "-")
                        .font(Font.custom("Helvetica Neue", size: 20))
                        .fontWeight(.bold)
                    Spacer()
                    Text(self.item.playbackDuration.stringFromTimeInterval())
                        .opacity(0.4)
                        .padding(.horizontal, 5)
                        .font(Font.custom("Helvetica Neue", size: 20))
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                
            }
        }.buttonStyle(iOS6ListBtn())
    }
}
