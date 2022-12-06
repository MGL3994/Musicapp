//
//  AlbumsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct AlbumView: View {
    
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
        self.artworkImage = artwork.image(at: CGSize(width: 300, height: 300))!
        songsQuery = MPMediaQuery.songs()
        albumPredicate = MPMediaPropertyPredicate(value: albumTitle, forProperty: MPMediaItemPropertyAlbumTitle)
        songsQuery.addFilterPredicate(albumPredicate)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                if self.artworkImage != nil {
                    Image(uiImage: self.artworkImage)
                        .resizable()
                        .frame(
                            width: 100,
                            height: 100
                        )
                        .cornerRadius(6)
                        //.shadow(radius: 10)
                }
                VStack(alignment: .leading) {
                    Text(self.albumTitle)
                        .lineLimit(1)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(self.artist)
                        .opacity(0.5)
                }.padding(.leading, 5)
                Spacer()
            }
            .padding(.top, 120)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            HStack() {
                Button {
                    /*let descriptor = MPMusicPlayerMediaItemQueueDescriptor(query: songsQuery)
                    model.musicPlayer.setQueue(with: descriptor)
                    model.musicPlayer.play()
                    model.isPlaying = true
                    model.playingSong = model.musicPlayer.nowPlayingItem
                    model.isPlayerOpen.toggle()*/
                } label: {
                    Image(systemName: "play.fill")
                    Text("Reproducir")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                
                Button{
                    /*let descriptor = MPMusicPlayerMediaItemQueueDescriptor(query: songsQuery)
                    model.musicPlayer.setQueue(with: descriptor)
                    model.musicPlayer.shuffleMode = MPMusicShuffleMode.songs
                    model.musicPlayer.play()
                    model.isPlaying = true
                    model.playingSong = model.musicPlayer.nowPlayingItem
                    model.isPlayerOpen.toggle()*/
                } label: {
                    Image(systemName: "shuffle")
                    Text("Aleatorio")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            Divider()

            List {
                ForEach(songsQuery.items!, id: \.persistentID) { song in
                    AlbumSongCell(song)
                }
            }
            .listStyle(PlainListStyle())
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}


