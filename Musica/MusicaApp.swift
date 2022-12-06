//
//  MusicaApp.swift
//  Musica
//
//  Created by Miguel on 28/11/22.
//

import SwiftUI
import StoreKit
import MediaPlayer

@main
struct MusicaApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        updateSongs()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onChange(of: scenePhase, perform: { value in
                    if value == .active {
                        updateSongs()
                    }
                }).accentColor(.pink)
        }
    }
    
    func updateSongs() {
        SKCloudServiceController.requestAuthorization { status in
            if status == .authorized {
                let songsQuery = MPMediaQuery.songs()
                if let songs = songsQuery.items {
                    Model.shared.songs = songs
                }
                let playlistQuery = MPMediaQuery.playlists()
                if let playlists = playlistQuery.collections {
                    Model.shared.playlists = playlists
                }
                let albumsQuery = MPMediaQuery.albums()
                albumsQuery.groupingType = MPMediaGrouping.album
                if let albums = albumsQuery.collections {
                    Model.shared.albums = albums
                }
                let artistsQuery = MPMediaQuery.artists()
                if let artists = artistsQuery.collections {
                    Model.shared.artists = artists
                }
            }
        }
    }
}
