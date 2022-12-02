//
//  AlbumsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct PlaylistsView: View {
    
    let playlistsQuery: MPMediaQuery
    let allPlaylists: [MPMediaItemCollection]
    
    init() {
        playlistsQuery = MPMediaQuery.playlists()
        //playlistsQuery.groupingType = MPMediaGrouping.playlist
        //let palylistPredicate = MPMediaPropertyPredicate(value: "music", forProperty: MPMediaItemPropertyMediaType)
        //playlistsQuery.addFilterPredicate(palylistPredicate)
        allPlaylists = playlistsQuery.collections!
    }
    
    var body: some View {
        
        NavigationView {
            ZStack() {
                List {
                    ForEach(allPlaylists, id: \.self) { playlist in
                        PlaylistCell(playlist)
                        //let plname = playlist.value(forProperty: MPMediaPlaylistPropertyName) as? String
                        //Text("\(plname ?? "Unknown")")
                    }
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("Listas")
            }
        }
    }
}

struct PlaylistCell: View {

    let item: MPMediaItemCollection

    init(_ item: MPMediaItemCollection) {
        self.item = item
    }

    var body: some View {
        
        NavigationLink(destination: PlaylistView(self.item)) {
            Button(action: {}) {
                HStack() {
                    /*if self.item.title != nil {
                        Image(uiImage: (self.item.representativeItem?.artwork!.image(at: CGSize(width: 50, height: 50)))!)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(4)
                    }
                    VStack(alignment: .leading) {*/
                    Text("\(self.item.value(forProperty: MPMediaPlaylistPropertyName) as? String ?? "Unknown")")
                    //Text(self.item.representativeItem?.title ?? "-")
                    //}
                }
            }
            .frame(
                minWidth: 300,
                maxWidth: 300,
                minHeight: 37,
                maxHeight: 37,
                alignment: .leading
            )
        }
    }
}
