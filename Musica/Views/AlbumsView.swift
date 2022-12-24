//
//  AlbumsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct AlbumsView: View {
    
    @EnvironmentObject var model: Model
    @State private var searchText: String = ""
    @State private var albumsList: [MPMediaItemCollection] = []
    
    var body: some View {
        
        List {
            ForEach(albumsList, id: \.self) { album in
                AlbumCell(album: album)
            }
        }
        .listStyle(PlainListStyle())
        .navigationBarTitle("Álbumes")
        .toolbar {
            Button(action: {
                model.isPlayerOpen.toggle()
            }) {
                Image(systemName: "play.circle.fill")
            }
        }
        .searchable(text: $searchText, prompt: "Buscar")
        .onChange(of: searchText) { _ in
            albumsList = listAlbums()
        }
        .onSubmit(of: .search) {
            albumsList = listAlbums()
        }
        .onAppear() {
            albumsList = listAlbums()
        }
        
    }
    
    func listAlbums() -> [MPMediaItemCollection] {
        if searchText.isEmpty {
            return model.albums
        } else {
            return model.albums.filter { $0.representativeItem!.albumTitle!.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
