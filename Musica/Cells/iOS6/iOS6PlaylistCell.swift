//
//  PlaylistCell.swift
//  Musica
//
//  Created by Miguel on 3/12/22.
//

import SwiftUI
import MediaPlayer

struct iOS6PlaylistCell: View {

    let playlist: MPMediaItemCollection

    var body: some View {
        NavigationLink {
            PlaylistView(playlist)
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
                ZStack {
                    Text(playlist.value(forProperty: MPMediaPlaylistPropertyName) as? String ?? "Playlist sin nombre")
                        //.foregroundColor(Color(red: 55/225, green: 55/225, blue: 55/225))
                        .font(Font.custom("Helvetica Neue", size: 20))
                        .fontWeight(.bold)
                        //.shadow(color: Color(UIColor.black.withAlphaComponent(0.2)), radius: 0, x: 0, y: -1)
                        //.shadow(color: Color(UIColor.white.withAlphaComponent(1.0)), radius: 0, x: 0, y: 1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
            }
            
        }.buttonStyle(iOS6ListBtn())
    }
}
