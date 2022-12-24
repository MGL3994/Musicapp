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

    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    
    var body: some View {
        
        #if os(iOS)
        if horizontalSizeClass == .compact {
            tabBarView().environmentObject(model)
        } else {
            sideBarView().environmentObject(model)
        }
        #endif
    }
}

struct sideBarView: View {
    
    @EnvironmentObject var model: Model
    @State var selection: String? = "Canciones"
    let sidebarOps = ["Canciones", "Albums", "Artistas"]
    
    var body: some View {
        NavigationSplitView {
            List(sidebarOps, id: \.self, selection: $selection) { op in
                NavigationLink(value: op, label: { Text(op)} )
            }.navigationTitle("Biblioteca")
        } detail: {
            if let section = selection {
                switch section {
                case "Canciones":
                    SongsView()
                        .environmentObject(model)
                case "Albums":
                    AlbumsView()
                        .environmentObject(model)
                case "Artistas":
                    ArtistsView()
                        .environmentObject(model)
                default:
                    SongsView()
                        .environmentObject(model)
                }
            }
        }
    }
}


struct tabBarView: View {
    
    @EnvironmentObject var model: Model
    @State var selectedTab = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                NavigationView {
                    PlaylistsView()
                        .environmentObject(model)
                }
                .tabItem {
                    VStack{
                        Image(systemName: "music.note.list")
                        Text("Playlists")
                    }
                }.tag(0)
                
                NavigationView {
                    SongsView()
                        .environmentObject(model)
                }
                .tabItem {
                    VStack{
                        Image(systemName: "music.note")
                        Text("Canciones")
                    }
                }.tag(1)
                
                NavigationView {
                    AlbumsView()
                        .environmentObject(model)
                }
                .tabItem {
                    VStack{
                        Image(systemName: "square.stack")
                        Text("Álbumes")
                    }
                }.tag(2)
                
                NavigationView {
                    ArtistsView()
                        .environmentObject(model)
                }
                .tabItem {
                    VStack{
                        Image(systemName: "music.mic")
                        Text("Artistas")
                    }
                }.tag(3)
            }
            .zIndex(1.0)
            .sheet(isPresented: $model.isPlayerOpen, content: {
                NowPlayingView()
                    .environmentObject(model)
            })
        }
    }
    
}
