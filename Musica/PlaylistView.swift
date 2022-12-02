//
//  AlbumsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct PlaylistView: View {
    
    let item: MPMediaItemCollection

    
    init(_ item: MPMediaItemCollection) {
        self.item = item

    }
    
    var body: some View {
        Text("Playlist")
    }
}
