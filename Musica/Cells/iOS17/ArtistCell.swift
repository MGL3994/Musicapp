//
//  ArtistCell.swift
//  Musica
//
//  Created by Miguel on 3/12/22.
//

import SwiftUI
import MediaPlayer

struct ArtistCell: View {

    let artist: MPMediaItemCollection

    var body: some View {
        NavigationLink(destination: ArtistView(artist), label: {
            VStack(alignment: .leading) {
                Text((artist.representativeItem?.artist!)!)
                    .padding(.leading, 5)
                    .bold()
                if artist.items.count > 1 {
                    Text("\(artist.items.count) Canciones")
                        .font(.system(.callout))
                        .opacity(0.4)
                        .padding(.leading, 5)
                } else {
                    Text("1 Canción")
                        .font(.system(.callout))
                        .opacity(0.4)
                        .padding(.leading, 5)
                }
            }.frame(
                minHeight: 37,
                maxHeight: 37,
                alignment: .leading
            )
        })
    }
}
