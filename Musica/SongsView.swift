//
//  SongsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct SongsView: View {
    
    let songsQuery: MPMediaQuery
    
    init() {
        songsQuery = MPMediaQuery.songs()
    }
    
    var body: some View {
        NavigationView {
            ZStack() {
                List {
                    ForEach(songsQuery.items!, id: \.persistentID) { song in
                        SongCell(song)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("Canciones")
            }
        }
    }
}

struct SongCell: View {

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
                if self.item.artwork != nil {
                    Image(uiImage: (self.item.artwork?.image(at: CGSize(width: 50, height: 50)))!)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(4)
                }
                VStack(alignment: .leading) {
                    Text(self.item.title ?? "-")
                    Text(self.item.artist ?? "-").font(.system(.footnote)).opacity(0.4)
                }
                Spacer()
                Text(self.item.playbackDuration.stringFromTimeInterval())
                    .opacity(0.4)
                    .padding(.horizontal, 5)
            }}
            .frame(
                minWidth: 350,
                maxWidth: 350,
                minHeight: 37,
                maxHeight: 37,
                alignment: .leading
            )
    }
}
