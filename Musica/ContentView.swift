//
//  ContentView.swift
//  Musica
//
//  Created by Miguel on 28/11/22.
//

import SwiftUI
import MediaPlayer

struct ContentView: View {
    
    @ObservedObject var model = Model.shared
    @Namespace var animation
    
    var body: some View {

        ZStack {
            TabView() {
                VStack(spacing: 0) {
                    PlaylistsView()
                        .environmentObject(model)
                }
                .tabItem {
                    VStack{
                        Image(systemName: "music.note.list")
                        Text("Listas")
                    }
                }
                
                VStack(spacing: 0) {
                    SongsView()
                        .environmentObject(model)
                }
                .tabItem {
                    VStack{
                        Image(systemName: "music.note")
                        Text("Canciones")
                    }
                }
                
                VStack(spacing: 0) {
                    AlbumsView()
                        .environmentObject(model)
                }
                .tabItem {
                    VStack{
                        Image(systemName: "square.stack")
                        Text("Álbumes")
                    }
                    
                }
                
                VStack(spacing: 0) {
                    ArtistsView()
                        .environmentObject(model)
                }
                .tabItem {
                    VStack{
                        Image(systemName: "music.mic")
                        Text("Artistas")
                    }
                    
                }
            }
            .zIndex(1.0)
            .sheet(isPresented: $model.isPlayerOpen, content: {
                NowPlayingView()
                    .environmentObject(model)
            })
        }
    }
}

/*
 
 
 ZStack {
     TabView() {
         VStack(spacing: 0) {
             PlaylistsView()
                 .environmentObject(model)
             if !model.isPlayerOpen {
                 NowPlayingBarView(animation: animation)
                     .environmentObject(model)
             }
         }
         .tabItem {
             VStack{
                 Image(systemName: "music.note.list")
                 Text("Listas")
             }
         }
         
         VStack(spacing: 0) {
             SongsView()
                 .environmentObject(model)
             if !model.isPlayerOpen {
                 NowPlayingBarView(animation: animation)
                     .environmentObject(model)
             }
         }
         .tabItem {
             VStack{
                 Image(systemName: "music.note")
                 Text("Canciones")
             }
         }
         
         VStack(spacing: 0) {
             AlbumsView()
                 .environmentObject(model)
             if !model.isPlayerOpen {
                 NowPlayingBarView(animation: animation)
                     .environmentObject(model)
             }
         }
         .tabItem {
             VStack{
                 Image(systemName: "square.stack")
                 Text("Álbumes")
             }
             
         }
         
         VStack(spacing: 0) {
             ArtistsView()
                 .environmentObject(model)
             if !model.isPlayerOpen {
                 NowPlayingBarView(animation: animation)
                     .environmentObject(model)
             }
         }
         .tabItem {
             VStack{
                 Image(systemName: "music.mic")
                 Text("Artistas")
             }
             
         }
     }
     .zIndex(1.0)
     
     if model.isPlayerOpen {
         NowPlayingView(animation: animation)
             .environmentObject(model)
             .edgesIgnoringSafeArea(.all)
             .zIndex(2.0)
             .onTapGesture {
                 model.isPlayerOpen.toggle()
             }
     }
 }
 
 */
