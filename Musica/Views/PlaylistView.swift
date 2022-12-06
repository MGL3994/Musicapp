//
//  AlbumsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct PlaylistView: View {
    
    let item: MPMediaItemCollection
    let playlist: String
    var songsQuery = MPMediaQuery()
    var playlistPredicate = MPMediaPropertyPredicate()
    
    init(_ item: MPMediaItemCollection) {
        self.item = item
        playlist = (self.item.value(forProperty: MPMediaPlaylistPropertyName) as? String)!
        songsQuery = MPMediaQuery.songs()
        playlistPredicate = MPMediaPropertyPredicate(value: playlist, forProperty: MPMediaPlaylistPropertyName)
        songsQuery.addFilterPredicate(playlistPredicate)
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(songsQuery.items!, id: \.persistentID) { song in
                    SongCell(song: song)
                }
            }
            .listStyle(PlainListStyle())
            
        }
        .navigationTitle(playlist)
        .accentColor(.primary)
    }
}
