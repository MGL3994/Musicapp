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
    
    @State private var path = NavigationPath()
    @EnvironmentObject var model: Model
    @State var selectedTab = 0
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .fill(Color(red: 21/255, green: 21/255, blue: 21/255))
                    .frame(height: 2)
                Rectangle()
                    .fill(Color(red: 68/255, green: 68/255, blue: 68/255))
                    .frame(height: 2)
                Rectangle()
                    .fill(Color(red: 52/255, green: 52/255, blue: 52/255))
                    .frame(height: 2)
                Spacer()
                Rectangle()
                    .fill(Color(red: 0/255, green: 0/255, blue: 0/255))
                    .frame(height: 2)
            }
            TabView(selection: $selectedTab) {
                NavigationView {
                    iOS6PlaylistsView()
                        .environmentObject(model)
                }
                .tag(0)
                
                NavigationView {
                    iOS6SongsView()
                        .environmentObject(model)
                }.tag(1)
                
                NavigationView {
                    iOS6AlbumsView()
                        .environmentObject(model)
                }.tag(2)
                
                NavigationView {
                    iOS6ArtistsView()
                        .environmentObject(model)
                }.tag(3)
            }
            .zIndex(1.0)
            .sheet(isPresented: $model.isPlayerOpen, content: {
                NowPlayingView()
                    .environmentObject(model)
            })
        }.overlay(
            VStack(spacing: 0) {
                ZStack {
                    VStack {
                        Rectangle()
                            .fill(Color(.white.withAlphaComponent(0.24)))
                            .frame(height: 1.5)
                        Spacer()
                        Rectangle()
                            .fill(LinearGradient(
                                gradient: Gradient(stops: [
                                    Gradient.Stop(color: Color(red: 0/255, green: 0/255, blue: 0/255), location: 0),
                                    Gradient.Stop(color: Color(red: 255/255, green: 255/255, blue: 255/255).opacity(0.5), location: 0.5),
                                    Gradient.Stop(color: Color(red: 0/255, green: 0/255, blue: 0/255), location: 1)
                                ]), startPoint: .leading, endPoint: .trailing
                            ))
                            .frame(height: 1)
                    }
                    HStack {
                        Spacer()
                        Button {
                            self.selectedTab = 0
                        } label: {
                            iOS6TabBarItem(glyph: "music.note.list", title: "Playlists", selectedTab: selectedTab, tab: 0)
                        }
                        Spacer()
                        Button {
                            self.selectedTab = 1
                        } label: {
                            iOS6TabBarItem(glyph: "music.note", title: "Canciones", selectedTab: selectedTab, tab: 1)
                        }
                        Spacer()
                        Button {
                            self.selectedTab = 2
                        } label: {
                            iOS6TabBarItem(glyph: "square.stack", title: "Albums", selectedTab: selectedTab, tab: 2)
                        }
                        Spacer()
                        Button {
                            self.selectedTab = 3
                        } label: {
                            iOS6TabBarItem(glyph: "music.mic", title: "Artistas", selectedTab: selectedTab, tab: 3)
                        }
                        Spacer()
                    }
                }
                .frame(height: 52)
                .background(LinearGradient(stops: [
                    Gradient.Stop(color: Color(red: 36/255, green: 36/255, blue: 36/255), location: 0),
                    Gradient.Stop(color: Color(red: 10/255, green: 10/255, blue: 10/255), location: 0.5),
                    Gradient.Stop(color: .black, location: 1)
                ], startPoint: .top, endPoint: .bottom))
                .shadow(color: Color(.black.withAlphaComponent(0.5)), radius: 4, x: 0, y: 0)
            }
            .edgesIgnoringSafeArea(.all)
            .background(.black)
        ,alignment: .bottom)
    }
}

struct iOS6TabBarItem: View {
    
    let glyph: String
    let title: String
    let selectedTab: Int
    let tab: Int
    
    var body: some View {
        
        let activeAquaGradient: LinearGradient = LinearGradient(stops: [
            Gradient.Stop(color: Color(red: 213/255, green: 229/255, blue: 249/255), location: 0),
            Gradient.Stop(color: Color(red: 108/255, green: 166/255, blue: 231/255), location: 0.5),
            Gradient.Stop(color: Color(red: 32/255, green: 115/255, blue: 239/255), location: 0.5),
            Gradient.Stop(color: Color(red: 57/255, green: 195/255, blue: 249/255), location: 1)
        ], startPoint: .top, endPoint: .bottom)
        
        let inactiveAquaGradient: LinearGradient = LinearGradient(stops: [
            Gradient.Stop(color: Color(red: 123/255, green: 123/255, blue: 123/255), location: 0),
            Gradient.Stop(color: Color(red: 71/255, green: 71/255, blue: 71/255), location: 1)
        ], startPoint: .top, endPoint: .bottom)
        
        let selectedTabGradient: LinearGradient = LinearGradient(stops: [
            Gradient.Stop(color: Color(red: 57/255, green: 57/255, blue: 57/255), location: 0),
            Gradient.Stop(color: Color(red: 41/255, green: 41/255, blue: 41/255), location: 0.5),
            Gradient.Stop(color: Color(red: 30/255, green: 30/255, blue: 30/255), location: 0.51),
            Gradient.Stop(color: Color(red: 25/255, green: 25/255, blue: 25/255), location: 1)
        ], startPoint: .top, endPoint: .bottom)
        
        let unselectedTabGradient: LinearGradient = LinearGradient(stops: [
            Gradient.Stop(color: Color(red: 57/255, green: 57/255, blue: 57/255, opacity: 0), location: 0),
            Gradient.Stop(color: Color(red: 41/255, green: 41/255, blue: 41/255, opacity: 0), location: 0.5),
            Gradient.Stop(color: Color(red: 30/255, green: 30/255, blue: 30/255, opacity: 0), location: 0.51),
            Gradient.Stop(color: Color(red: 25/255, green: 25/255, blue: 25/255, opacity: 0), location: 1)
        ], startPoint: .top, endPoint: .bottom)
        
        ZStack {
            Rectangle()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundStyle(selectedTab == tab ? selectedTabGradient : unselectedTabGradient)
            VStack(spacing: 0) {
                Image(systemName: "\(glyph)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundStyle(selectedTab == tab ? activeAquaGradient : inactiveAquaGradient)
                Text("\(title)")
                    .fontWeight(.bold)
                    .font(Font.custom("Helvetica Neue", size: 12))
                    .foregroundStyle(selectedTab == tab ? .white : Color(red: 135/255, green: 135/255, blue: 135/255))
            }
        }
        .frame(width: 80, height: 44)
    }
}
