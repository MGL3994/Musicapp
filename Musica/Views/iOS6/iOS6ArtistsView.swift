//
//  AlbumsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct iOS6ArtistsView: View {
    
    @EnvironmentObject var model: Model
    @State private var searchText: String = ""
    @State private var artistsList: [MPMediaItemCollection] = []
    
    var body: some View {
        VStack(spacing: 0) {
            iOS6NavBar(title: "Artistas")
                .zIndex(5.0)
            ScrollView(.vertical) {
                LazyVStack(spacing: 0) {
                    ForEach(model.artists, id: \.self) { artist in
                        iOS6ArtistCell(artist: artist)
                    }
                }
            }
            .padding(.bottom, 86)
            .onAppear() {
                artistsList = listArtists()
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
    func listArtists() -> [MPMediaItemCollection] {
        if searchText.isEmpty {
            return model.artists
        } else {
            return model.artists.filter { $0.representativeItem!.artist!.localizedCaseInsensitiveContains(searchText) }
        }
    }
}


