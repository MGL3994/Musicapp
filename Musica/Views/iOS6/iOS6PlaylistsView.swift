//
//  AlbumsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct iOS6PlaylistsView: View {
    
    @EnvironmentObject var model: Model
    @State private var searchText: String = ""
    @State private var playlistsList: [MPMediaItemCollection] = []
    
    var body: some View {
        
        VStack(spacing: 0) {
            iOS6NavBar(title: "Playlists")
                .zIndex(5.0)
            ScrollView(.vertical) {
                LazyVStack(spacing: 0) {
                    ForEach(model.playlists, id: \.self) { playlist in
                        iOS6PlaylistCell(playlist: playlist)
                    }
                }
            }
            .padding(.bottom, 86)
            .onAppear() {
                playlistsList = listPlaylist()
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
    func listPlaylist() -> [MPMediaItemCollection] {
        if searchText.isEmpty {
            return model.playlists
        } else {
            return model.playlists.filter {
                let playlistname = $0.value(forProperty: MPMediaPlaylistPropertyName) as! String
                return playlistname.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
