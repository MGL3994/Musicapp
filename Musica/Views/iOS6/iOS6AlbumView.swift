//
//  AlbumsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct iOS6AlbumView: View {
    
    //@Environment var model: Model
    
    let album: MPMediaItemCollection
    let albumTitle: String
    let artist: String
    let artwork: MPMediaItemArtwork
    let artworkImage: UIImage
    var songsQuery = MPMediaQuery()
    var albumPredicate = MPMediaPropertyPredicate()

    
    init(album: MPMediaItemCollection) {
        self.album = album
        self.albumTitle = (self.album.representativeItem?.albumTitle)!
        self.artist = (self.album.representativeItem?.albumArtist)!
        self.artwork = (self.album.representativeItem?.artwork)!
        self.artworkImage = artwork.image(at: CGSize(width: 300, height: 300)) ?? UIImage(named: "Cover") ?? UIImage()
        songsQuery = MPMediaQuery.songs()
        albumPredicate = MPMediaPropertyPredicate(value: albumTitle, forProperty: MPMediaItemPropertyAlbumTitle)
        songsQuery.addFilterPredicate(albumPredicate)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            iOS6NavBar(title: self.albumTitle)
                .zIndex(5.0)
            
            HStack(alignment: .top) {

                Image(uiImage: self.artworkImage)
                    .resizable()
                    .frame(
                        width: 100,
                        height: 100
                    )
                    .shadow(radius: 2)
                VStack(alignment: .leading) {
                    Text(self.albumTitle)
                        .lineLimit(1)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(self.artist)
                        .opacity(0.5)
                    Spacer()
                    HStack {
                        Spacer()
                        Button{
                            /*let descriptor = MPMusicPlayerMediaItemQueueDescriptor(query: songsQuery)
                            model.musicPlayer.setQueue(with: descriptor)
                            model.musicPlayer.shuffleMode = MPMusicShuffleMode.songs
                            model.musicPlayer.play()
                            model.isPlaying = true
                            model.playingSong = model.musicPlayer.nowPlayingItem
                            model.isPlayerOpen.toggle()*/
                        } label: {
                            HStack {
                                Text("Aleatorio")
                                    .fontWeight(.bold)
                                    .shadow(color: Color(UIColor.white.withAlphaComponent(0.5)), radius: 0, x: 0, y: 1)
                                Image(systemName: "shuffle")
                                    .fontWeight(.bold)
                                    .shadow(color: Color(UIColor.white.withAlphaComponent(0.5)), radius: 0, x: 0, y: 1)
                            }.padding(.horizontal, 6)
                        }
                        .buttonStyle(iOS6Btn())
                    }
                }.padding(.leading, 5)
                Spacer()
            }
            .padding(.top, 10)
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
            .background(Color(red: 227/255, green: 229/255, blue: 232/255))
            .frame(height: 120)
            
            //Divider()
            Rectangle()
                .fill(Color(red: 185/255, green: 187/255, blue: 189/255))
                .frame(height: 1)

            List {
                ForEach(songsQuery.items!, id: \.persistentID) { song in
                    iOS6AlbumSongCell(song)
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(PlainListStyle())
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitleDisplayMode(.inline)
        //.navigationBarHidden(true)
        //.navigationBarBackButtonHidden(true)
    }
}
