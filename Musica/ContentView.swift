//
//  ContentView.swift
//  Musica
//
//  Created by Miguel on 28/11/22.
//

import SwiftUI
import MediaPlayer

struct ContentView: View {

    @EnvironmentObject var musicLibrary: MusicLibrary
    
    var body: some View {
        TabView() {
            PlaylistsView().tabItem {
                Image(systemName: "music.note.list")
                Text("Listas")
            }
            SongsView().tabItem {
                Image(systemName: "music.note")
                Text("Canciones")
            }
            AlbumsView().tabItem {
                Image(systemName: "square.stack")
                Text("Álbumes")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
