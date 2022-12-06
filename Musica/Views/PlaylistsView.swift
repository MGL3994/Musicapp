//
//  AlbumsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct PlaylistsView: View {
    
    @EnvironmentObject var model: Model
    @State private var searchText: String = ""
    @State private var playlistsList: [MPMediaItemCollection] = []
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(model.playlists, id: \.self) { playlist in
                    PlaylistCell(playlist: playlist)
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Listas")
            .toolbar {
                Button(action: {
                    model.isPlayerOpen.toggle()
                }) {
                    Image(systemName: "play.circle.fill")
                }
            }
            .searchable(text: $searchText, prompt: "Buscar")
            .onChange(of: searchText) { _ in
                playlistsList = listPlaylist()
            }
            .onSubmit(of: .search) {
                playlistsList = listPlaylist()
            }
            .onAppear() {
                playlistsList = listPlaylist()
            }
        }
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
