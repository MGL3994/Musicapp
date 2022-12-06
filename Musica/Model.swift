//
//  Model.swift
//  Musica
//
//  Created by Miguel on 5/12/22.
//

import Foundation
import MediaPlayer

class Model: ObservableObject {
    
    static let shared = Model()
    
    var musicPlayer = MPMusicPlayerController.applicationQueuePlayer
    var playbackState = MPMusicPlayerController.applicationQueuePlayer.playbackState
    
    @Published var playingSong: MPMediaItem?
    @Published var isPlayerOpen = false
    @Published var isPlaying = false
    
    @Published var playlists = [MPMediaItemCollection]()
    @Published var songs = [MPMediaItem]()
    @Published var albums = [MPMediaItemCollection]()
    @Published var artists = [MPMediaItemCollection]()
    
}
