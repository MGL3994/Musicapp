//
//  iOS6ArtistCell.swift
//  Musica
//
//  Created by Miguel on 18/12/23.
//

import SwiftUI
import MediaPlayer

struct iOS6ArtistCell: View {

    let artist: MPMediaItemCollection

    var body: some View {
        NavigationLink {
            ArtistView(artist)
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
                    VStack(alignment: .leading) {
                        Text((artist.representativeItem?.artist!)!)
                            .font(Font.custom("Helvetica Neue", size: 20))
                            .fontWeight(.bold)
                        if artist.items.count > 1 {
                            Text("\(artist.items.count) Canciones")
                                .opacity(0.4)
                                .fontWeight(.regular)
                                .font(Font.custom("Helvetica Neue", size: 15))
                        } else {
                            Text("1 Canción")
                                .opacity(0.4)
                                .fontWeight(.regular)
                                .font(Font.custom("Helvetica Neue", size: 15))
                        }
                    }.padding(.leading, 16)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.buttonStyle(iOS6ListBtn())
    }
}
