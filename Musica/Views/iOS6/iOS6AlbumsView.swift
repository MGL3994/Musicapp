//
//  AlbumsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct iOS6AlbumsView: View {
    
    @EnvironmentObject var model: Model
    @State private var searchText: String = ""
    @State private var albumsList: [MPMediaItemCollection] = []
    
    var body: some View {
        
        VStack(spacing: 0) {
            iOS6NavBar(title: "Albums")
                .zIndex(5.0)
            ScrollView(.vertical) {
                LazyVStack(spacing: 0) {
                    ForEach(albumsList, id: \.self) { album in
                        iOS6AlbumCell(album: album)
                    }
                }
            }
            .padding(.bottom, 86)
            .onAppear() {
                albumsList = listAlbums()
            }
        }.edgesIgnoringSafeArea(.all)
        
    }
    
    func listAlbums() -> [MPMediaItemCollection] {
        if searchText.isEmpty {
            return model.albums
        } else {
            return model.albums.filter { $0.representativeItem!.albumTitle!.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
