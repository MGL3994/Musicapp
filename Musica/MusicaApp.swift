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
        Model.shared.initialize()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onChange(of: scenePhase, perform: { value in
                    if value == .active {
                        Model.shared.initialize()
                    }
                }).accentColor(.pink)
        }
    }
}
