//
//  AlbumsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct AlbumsView: View {
    
    let albumsQuery: MPMediaQuery
    let allAlbums: [MPMediaItemCollection]
    
    init() {
        albumsQuery = MPMediaQuery.albums()
        albumsQuery.groupingType = MPMediaGrouping.album
        allAlbums = albumsQuery.collections!
    }
    
    var body: some View {
        
        NavigationView {
            ZStack() {
                List {
                    ForEach(allAlbums, id: \.self) { album in
                        AlbumCell(album)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("Álbumes")
            }
        }
    }
}

struct AlbumCell: View {

    let item: MPMediaItemCollection

    init(_ item: MPMediaItemCollection) {
        self.item = item
    }

    var body: some View {
        
        NavigationLink(destination: AlbumView(self.item)) {
            Button(action: {}) {
                HStack() {
                    if self.item.representativeItem?.artwork != nil {
                        Image(uiImage: (self.item.representativeItem?.artwork?.image(at: CGSize(width: 50, height: 50)))!)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(4)
                    }
                    VStack(alignment: .leading) {
                        if self.item.representativeItem?.albumTitle == "" {
                            Text(self.item.representativeItem?.title ?? "-")
                        } else {
                            Text(self.item.representativeItem?.albumTitle ?? "-")
                        }
                        Text(self.item.representativeItem?.albumArtist ?? "-").font(.system(.footnote)).opacity(0.4)
                    }
                }
            }
            .frame(
                minWidth: 300,
                maxWidth: 300,
                minHeight: 37,
                maxHeight: 37,
                alignment: .leading
            )
        }
    }
}
