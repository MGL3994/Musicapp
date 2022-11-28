//
//  ContentView.swift
//  Musica
//
//  Created by Miguel on 28/11/22.
//

import SwiftUI
import MediaPlayer

var mediaPicker = MPMediaPickerController()
var mediaQuery = MPMediaQuery.songs()
var player = MPMusicPlayerController.systemMusicPlayer


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
