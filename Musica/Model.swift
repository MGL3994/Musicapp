//
//  Model.swift
//  Musica
//
//  Created by Miguel on 5/12/22.
//

import Foundation
import MediaPlayer
import StoreKit

class Model: ObservableObject {
    
    static let shared = Model()
    
    var musicPlayer = MPMusicPlayerController.applicationQueuePlayer
    var playbackState = MPMusicPlayerController.applicationQueuePlayer.playbackState
    var authorizationNeeded = true
    
    @Published var playingSong: MPMediaItem?
    @Published var isPlayerOpen = false
    @Published var isPlaying = false
    
    @Published var playlists = [MPMediaItemCollection]()
    @Published var songs = [MPMediaItem]()
    @Published var albums = [MPMediaItemCollection]()
    @Published var artists = [MPMediaItemCollection]()
    
    func initialize() {
        SKCloudServiceController.requestAuthorization { status in
            if status == .authorized {
                Model.shared.authorizationNeeded = false
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
