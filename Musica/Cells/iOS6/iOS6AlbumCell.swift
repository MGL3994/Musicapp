//
//  AlbumCell.swift
//  Musica
//
//  Created by Miguel on 3/12/22.
//

import SwiftUI
import MediaPlayer

struct iOS6AlbumCell: View {
    
    let album: MPMediaItemCollection

    var body: some View {
        NavigationLink {
            iOS6AlbumView(album: album)
        } label: {
            ZStack {
                VStack {
                    Rectangle()
                        .fill(Color(.white.withAlphaComponent(0.8)))
                        .frame(height: 1)
                    Spacer()
                    Rectangle()
                        .fill(Color(red: 185/255, green: 187/255, blue: 189/255))
                        .frame(height: 1)
                }
                HStack {
                    Image(uiImage: album.representativeItem?.artwork?.image(at: CGSize(width: 50, height: 50)) ?? UIImage(named: "Cover") ?? UIImage())
                        .resizable()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading) {
                        Text(album.representativeItem?.albumTitle ?? "-")
                            .font(Font.custom("Helvetica Neue", size: 20))
                            .fontWeight(.bold)
                        Text(album.representativeItem?.albumArtist ?? "-")
                            .opacity(0.4)
                            .fontWeight(.regular)
                            .font(Font.custom("Helvetica Neue", size: 15))
                    }
                    //.shadow(color: Color(UIColor.black.withAlphaComponent(0.2)), radius: 0, x: 0, y: -1)
                    //.shadow(color: Color(UIColor.white), radius: 0, x: 0, y: 1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                //.padding(.leading, 16)
            }
        }.buttonStyle(iOS6ListBtn())
    }
}
