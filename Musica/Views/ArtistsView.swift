//
//  AlbumsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct ArtistsView: View {
    
    @EnvironmentObject var model: Model
    @State private var searchText: String = ""
    @State private var artistsList: [MPMediaItemCollection] = []
    
    var body: some View {
        
        List {
            ForEach(model.artists, id: \.self) { artist in
                ArtistCell(artist: artist)
            }
        }
        .listStyle(PlainListStyle())
        .navigationBarTitle("Artistas")
        .toolbar {
            Button(action: {
                model.isPlayerOpen.toggle()
            }) {
                Image(systemName: "play.circle.fill")
            }
        }
        .searchable(text: $searchText, prompt: "Buscar")
        .onChange(of: searchText) { _ in
            artistsList = listArtists()
        }
        .onSubmit(of: .search) {
            artistsList = listArtists()
        }
        .onAppear() {
            artistsList = listArtists()
        }
        
    }
    
    func listArtists() -> [MPMediaItemCollection] {
        if searchText.isEmpty {
            return model.artists
        } else {
            return model.artists.filter { $0.representativeItem!.artist!.localizedCaseInsensitiveContains(searchText) }
        }
    }
}


