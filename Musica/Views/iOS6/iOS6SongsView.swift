//
//  SongsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct iOS6SongsView: View {
    
    @EnvironmentObject var model: Model
    
    @State private var searchText: String = ""
    @State private var songsList: [MPMediaItem] = []
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 227/255, green: 229/255, blue: 232/255))
            VStack(spacing: 0) {
                iOS6NavBar(title: "Canciones")
                    .zIndex(5.0)
                ScrollView(.vertical) {
                    LazyVStack(spacing: 0) {
                        ForEach(songsList, id: \.self) { song in
                            iOS6SongCell(song: song)
                        }
                    }
                }
                .padding(.bottom, 86)
                .onAppear() {
                    songsList = listSongs()
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
    func listSongs() -> [MPMediaItem] {
        if searchText.isEmpty {
            return model.songs
        } else {
            return model.songs.filter { $0.title!.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
