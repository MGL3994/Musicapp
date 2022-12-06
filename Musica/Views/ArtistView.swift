//
//  AlbumsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct ArtistView: View {
    
    let item: MPMediaItemCollection
    let artist: String!
    var songsQuery = MPMediaQuery()
    var artistPredicate = MPMediaPropertyPredicate()

    init(_ item: MPMediaItemCollection) {
        self.item = item
        artist = self.item.representativeItem?.artist
        songsQuery = MPMediaQuery.songs()
        artistPredicate = MPMediaPropertyPredicate(value: artist, forProperty: MPMediaItemPropertyArtist)
        songsQuery.addFilterPredicate(artistPredicate)
        songsQuery.groupingType = MPMediaGrouping.album
    }
    
    var body: some View {
            
        VStack {
            List {
                ForEach(songsQuery.items!, id: \.persistentID) { song in
                    AlbumSongCell(song)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle(artist)
        }
    }
}
