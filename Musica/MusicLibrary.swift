//
//  MusicLibrary.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

class MusicLibrary: ObservableObject {

    @Published var MusicLibraryAccess: Bool = false

    init() {
        self.initMusicLibraryAccess()
    }

    private func initMusicLibraryAccess() -> Void {
        MPMediaLibrary.requestAuthorization { status in
            if status == .authorized {
                DispatchQueue.main.async {
                    self.MusicLibraryAccess = true
                    MPMusicPlayerController.systemMusicPlayer.prepareToPlay()
                }
            }
        }
    }
}
