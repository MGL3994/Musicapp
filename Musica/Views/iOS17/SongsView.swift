//
//  SongsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct SongsView: View {
    
    @EnvironmentObject var model: Model
    
    @State private var searchText: String = ""
    @State private var songsList: [MPMediaItem] = []
    
    var body: some View {
            
        List {
            ForEach(songsList, id: \.self) { song in
                SongCell(song: song)
                    .environmentObject(model)
            }
        }
        .listStyle(PlainListStyle())
        .navigationBarTitle("Canciones")
        .toolbar {
            Button(action: {
                model.isPlayerOpen.toggle()
            }) {
                Image(systemName: "play.circle.fill")
            }
        }
        .searchable(text: $searchText, prompt: "Buscar")
        .onChange(of: searchText) { _ in
            songsList = listSongs()
        }
        .onSubmit(of: .search) {
            songsList = listSongs()
        }
        .onAppear() {
            songsList = listSongs()
        }
    }
    
    func listSongs() -> [MPMediaItem] {
        if searchText.isEmpty {
            return model.songs
        } else {
            return model.songs.filter { $0.title!.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
}
