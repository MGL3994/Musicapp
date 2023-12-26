//
//  PlaylistCell.swift
//  Musica
//
//  Created by Miguel on 3/12/22.
//

import SwiftUI
import MediaPlayer

struct PlaylistCell: View {

    let playlist: MPMediaItemCollection

    var body: some View {
        
        NavigationLink(destination: PlaylistView(playlist), label: {
            Text(playlist.value(forProperty: MPMediaPlaylistPropertyName) as? String ?? "Playlist sin nombre")
                .frame(
                    minHeight: 37,
                    maxHeight: 37,
                    alignment: .leading
                )
        })
    }
}
