//
//  AlbumsView.swift
//  Musica
//
//  Created by Miguel on 29/11/22.
//

import SwiftUI
import MediaPlayer

struct AlbumView: View {
    
    let item: MPMediaItemCollection
    let album: String!
    var songsQuery = MPMediaQuery()
    var albumPredicate = MPMediaPropertyPredicate()

    init(_ item: MPMediaItemCollection) {
        self.item = item
        album = self.item.representativeItem?.albumTitle
        songsQuery = MPMediaQuery.songs()
        albumPredicate = MPMediaPropertyPredicate(value: album, forProperty: MPMediaItemPropertyAlbumTitle)
        songsQuery.addFilterPredicate(albumPredicate)
    }
    
    var body: some View {
        NavigationView() {
            VStack() {
                
                if self.item.representativeItem?.artwork != nil {
                    Image(uiImage: (self.item.representativeItem?.artwork?.image(at: CGSize(width: 150, height: 150)))!)
                        .resizable()
                        .frame(
                            width: 150,
                            height: 150
                        )
                        .cornerRadius(8)
                        .shadow(radius: 10)
                }
                

                Text((self.item.representativeItem?.albumTitle)!)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 7)
                    .multilineTextAlignment(.center)
                Text((self.item.representativeItem?.albumArtist)!)
                    .foregroundColor(.pink)
                    .padding(.bottom, 10)
                
                HStack() {
                    Button {
                        let descriptor = MPMusicPlayerMediaItemQueueDescriptor(query: songsQuery)
                        MPMusicPlayerController.systemMusicPlayer.setQueue(with: descriptor)
                        MPMusicPlayerController.systemMusicPlayer.play()
                    }
                        label: {
                            Image(systemName: "play.fill")
                            Text("Reproducir")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                        .tint(.pink)
                        .controlSize(.large)
                    Button{
                        let descriptor = MPMusicPlayerMediaItemQueueDescriptor(query: songsQuery)
                        MPMusicPlayerController.systemMusicPlayer.setQueue(with: descriptor)
                        //MPMusicPlayerController.systemMusicPlayer.shuffleMode
                        MPMusicPlayerController.systemMusicPlayer.play()
                    }
                        label: {
                            Image(systemName: "shuffle")
                            Text("Aleatorio")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                        .tint(.pink)
                        .controlSize(.large)
                }
                .padding(.horizontal, 20)
                .multilineTextAlignment(.leading)
                
                List {
                    ForEach(songsQuery.items!, id: \.persistentID) { song in
                        AlbumSongCell(song)
                    }
                }
            }
            .padding(.top, 110)
            .edgesIgnoringSafeArea(.top)
        }
    }
}


struct AlbumSongCell: View {

    let item: MPMediaItem

    init(_ item: MPMediaItem) {
        self.item = item
    }

    var body: some View {

        Button(action: {
            let predicate = MPMediaPropertyPredicate(value: self.item.persistentID, forProperty: MPMediaItemPropertyPersistentID)
            let query = MPMediaQuery(filterPredicates: [predicate])
            let descriptor = MPMusicPlayerMediaItemQueueDescriptor(query: query)
            MPMusicPlayerController.systemMusicPlayer.setQueue(with: descriptor)
            MPMusicPlayerController.systemMusicPlayer.play()
        }) {
            HStack() {
                Text("\(self.item.albumTrackNumber ?? 1)")
                    .opacity(0.4)
                    .padding(.horizontal, 5)
                Text(self.item.title ?? "-")
                Spacer()
                Text(self.item.playbackDuration.stringFromTimeInterval())
                    .opacity(0.4)
                    .padding(.horizontal, 5)
                }}
            .frame(
                minWidth: 320,
                maxWidth: 320,
                minHeight: 37,
                maxHeight: 37,
                alignment: .leading
            )
    }
}
