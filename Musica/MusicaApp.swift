//
//  MusicaApp.swift
//  Musica
//
//  Created by Miguel on 28/11/22.
//

import SwiftUI

@main
struct MusicaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(MusicLibrary())
        }
    }
}
