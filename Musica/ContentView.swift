//
//  ContentView.swift
//  Musica
//
//  Created by Miguel on 28/11/22.
//

import SwiftUI
import MediaPlayer

class MusicLibrary: ObservableObject {

    @Published var MusicLibraryAccess: Bool = false
    @Published var songs: MPMediaQuery
    @Published var albums: MPMediaQuery

    init() {
        self.songs = MPMediaQuery()
        self.albums = MPMediaQuery()
        self.initMusicLibraryAccess()
    }

    private func initMusicLibraryAccess() -> Void {
        MPMediaLibrary.requestAuthorization { status in
            if status == .authorized {
                DispatchQueue.main.async {
                    self.MusicLibraryAccess = true
                    self.songs = MPMediaQuery.songs()
                    self.albums = MPMediaQuery.albums()
                    self.albums.groupingType = MPMediaGrouping.album
                    MPMusicPlayerController.systemMusicPlayer.prepareToPlay()
                }
            }
        }
    }
}

struct ContentView: View {

    @EnvironmentObject var musicLibrary: MusicLibrary
    
    var body: some View {
        
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            SongsView(musicLibrary).tabItem { Text("Canciones") }
            AlbumsView(musicLibrary).tabItem { Text("Álbumes") }
        }
    }
}

struct SongsView: View {
    
    let musicLibrary: MusicLibrary

    init(_ item: MusicLibrary) {
        self.musicLibrary = item
    }
    
    var body: some View {
        ZStack() {
            NavigationView {
                List {
                    ForEach(self.musicLibrary.songs.items!, id: \.persistentID) { song in
                        SongCell(song)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("Canciones")
            }
        }
    }
    
}

struct AlbumsView: View {
    
    let musicLibrary: MusicLibrary

    init(_ item: MusicLibrary) {
        self.musicLibrary = item
    }
    
    var body: some View {
        
        ZStack() {
            NavigationView {
                List {
                    ForEach(self.musicLibrary.albums.collections!, id: \.persistentID) { album in
                        AlbumCell(album)
                        /*Text(album.albumTitle)*/
                    }
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("Álbumes")
            }
        }
    }
}

struct SongCell: View {

    let item: MPMediaItem

    init(_ item: MPMediaItem) {
        self.item = item
    }

    var body: some View {

        Button(action: {
            let predicate = MPMediaPropertyPredicate(value: self.item.persistentID, forProperty: MPMediaItemPropertyPersistentID)
            let query = MPMediaQuery(filterPredicates: [predicate])
            let descriptor = MPMusicPlayerMediaItemQueueDescriptor(query: query)
            MPMusicPlayerController.systemMusicPlayer.setQueue(with: descriptor)
            MPMusicPlayerController.systemMusicPlayer.play()
        }) {
            VStack(alignment: .leading) {
                Text(self.item.title ?? "-")
                Text(self.item.artist ?? "-").font(.system(.footnote)).opacity(0.4)
            }}
            .frame(
                minWidth: 300,
                maxWidth: 300,
                minHeight: 37,
                maxHeight: 37,
                alignment: .leading
            )
    }
}

struct AlbumCell: View {

    let item: MPMediaItemCollection

    init(_ item: MPMediaItemCollection) {
        self.item = item
    }

    var body: some View {

        Button(action: {
            print("\(self.item)")
        }) {
            HStack() {
                if self.item.representativeItem?.artwork != nil {
                    Image(uiImage: (self.item.representativeItem?.artwork?.image(at: CGSize(width: 50, height: 50)))!)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(4)
                }
                VStack(alignment: .leading) {
                    Text(self.item.representativeItem?.albumTitle ?? "-")
                    Text(self.item.representativeItem?.albumArtist ?? "-").font(.system(.footnote)).opacity(0.4)
                }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
