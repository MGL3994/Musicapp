//
//  AlbumCell.swift
//  Musica
//
//  Created by Miguel on 3/12/22.
//

import SwiftUI
import MediaPlayer

struct AlbumCell: View {
    
    let album: MPMediaItemCollection

    var body: some View {
        
        NavigationLink(destination: AlbumView(album: album), label: {
            HStack() {
                if album.representativeItem?.artwork != nil {
                    Image(uiImage: (album.representativeItem?.artwork?.image(at: CGSize(width: 50, height: 50)))!)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(4)
                }
                VStack(alignment: .leading) {
                    Text(album.representativeItem?.albumTitle ?? "-")
                        .bold()

                    Text(album.representativeItem?.albumArtist ?? "-").font(.system(.callout)).opacity(0.4)
                }
            }.frame(
                minHeight: 37,
                maxHeight: 37,
                alignment: .leading
            )
        })
    }
}
