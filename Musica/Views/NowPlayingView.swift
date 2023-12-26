//
//  NowPlayingView.swift
//  Musica
//
//  Created by Miguel on 5/12/22.
//

import SwiftUI
import MediaPlayer

struct NowPlayingView: View {
    
    @EnvironmentObject var model: Model
    @State var scroller: Double = 2
    @State var playerDuration: TimeInterval = 100
    @State var volume: Float = 0.3
    @State private var currentValue1 = 6.0
    
    var body: some View {
        
        let nowPlayingSong = model.playingSong
        
        var color: Color = .white
        var normalFillColor: Color { color.opacity(0.5) }
        var emptyColor: Color { color.opacity(0.3) }
        
        VStack(spacing: 0) {
            iOS6BlackNavBar()
            ZStack {
                PlayerGlass()
                VStack() {
                    Spacer()
                    iOS6Slider(value: $scroller)
                    //iOS6Slider(value: model.musicPlayer.currentPlaybackTime)
                        .frame(height: 10)
                        .padding(.horizontal, 30)
                        //.padding(.top, 50)
                    Spacer()
                    /*HStack {
                        Spacer()
                        Image(systemName: "repeat")
                            .font(.system(size: 20)).foregroundColor(.white)
                        Spacer()
                        Image(systemName: "airplayaudio")
                            .font(.system(size: 20)).foregroundColor(.white)
                        Spacer()
                        Image(systemName: "list.bullet")
                            .font(.system(size: 20)).foregroundColor(.white)
                        Spacer()
                    }.padding(.bottom, 10)*/
                }
            }
            .frame(height: 100)
            //.frame(height: 80)
            .background(LinearGradient(gradient: Gradient(
                stops: [
                    Gradient.Stop(color: Color(red: 33/255, green: 33/255, blue: 33/255), location: 0),
                    Gradient.Stop(color: Color(red: 3/255, green: 3/255, blue: 3/255), location: 1)
                ]
            ), startPoint: .top, endPoint: .bottom))
            
            Image(uiImage: nowPlayingSong?.artwork?.image(at: CGSize(width: 250, height: 250)) ?? UIImage(named: "Cover") ?? UIImage())
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
            
            ZStack {
                PlayerGlass()
                VStack {
                    ZStack {
                        VStack {
                            Rectangle()
                                .fill(Color(red: 117/255, green: 117/255, blue: 117/255).opacity(0.5))
                                .frame(height: 1)
                            Spacer()
                            Rectangle()
                                .fill(Color(red: 117/255, green: 117/255, blue: 117/255))
                                .frame(height: 1)
                        }
                        
                        HStack(spacing: 2) {
                            
                            Button {} label: {
                                ZStack {
                                    Image(systemName: "repeat")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.black.opacity(0.4))
                                        .shadow(color: Color(UIColor.white.withAlphaComponent(0.5)), radius: 0, x: 0, y: 1)
                                        .shadow(color: Color(UIColor.black.withAlphaComponent(0.3)), radius: 0, x: 0, y: -1)
                                    VStack {
                                        Rectangle()
                                            .fill(Color(UIColor.white.withAlphaComponent(0.8)))
                                            .frame(height: 1.5)
                                        Spacer()
                                        Rectangle()
                                            .fill(Color(UIColor.black.withAlphaComponent(0.3)))
                                            .frame(height: 1.5)
                                    }
                                }
                            }.buttonStyle(iOS6PlayerBtn())

                            Button {} label: {
                                ZStack {
                                    Image(systemName: "backward.fill")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.black.opacity(0.4))
                                        .shadow(color: Color(UIColor.white.withAlphaComponent(0.5)), radius: 0, x: 0, y: 1)
                                        .shadow(color: Color(UIColor.black.withAlphaComponent(0.3)), radius: 0, x: 0, y: -1)
                                    VStack {
                                        Rectangle()
                                            .fill(Color(UIColor.white.withAlphaComponent(0.8)))
                                            .frame(height: 1.5)
                                        Spacer()
                                        Rectangle()
                                            .fill(Color(UIColor.black.withAlphaComponent(0.3)))
                                            .frame(height: 1.5)
                                    }
                                }
                            }.buttonStyle(iOS6PlayerBtn())
                            
                            Button {
                                model.isPlaying ? model.musicPlayer.pause() : model.musicPlayer.play()
                                model.isPlaying.toggle()
                            } label: {
                                ZStack {
                                    Image(systemName: model.isPlaying ? "pause.fill" : "play.fill")
                                        .font(.system(size: 30))
                                        .foregroundStyle(.black.opacity(0.4))
                                        .shadow(color: Color(UIColor.white.withAlphaComponent(0.5)), radius: 0, x: 0, y: 1)
                                        .shadow(color: Color(UIColor.black.withAlphaComponent(0.3)), radius: 0, x: 0, y: -1)
                                    VStack {
                                        Rectangle()
                                            .fill(Color(UIColor.white.withAlphaComponent(0.8)))
                                            .frame(height: 1.5)
                                        Spacer()
                                        Rectangle()
                                            .fill(Color(UIColor.black.withAlphaComponent(0.3)))
                                            .frame(height: 1.5)
                                    }
                                }
                            }.buttonStyle(iOS6PlayerBtn())
                            
                            Button {} label: {
                                ZStack {
                                    Image(systemName: "forward.fill")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.black.opacity(0.4))
                                        .shadow(color: Color(UIColor.white.withAlphaComponent(0.5)), radius: 0, x: 0, y: 1)
                                        .shadow(color: Color(UIColor.black.withAlphaComponent(0.3)), radius: 0, x: 0, y: -1)
                                    VStack {
                                        Rectangle()
                                            .fill(Color(UIColor.white.withAlphaComponent(0.8)))
                                            .frame(height: 1.5)
                                        Spacer()
                                        Rectangle()
                                            .fill(Color(UIColor.black.withAlphaComponent(0.3)))
                                            .frame(height: 1.5)
                                    }
                                }
                            }.buttonStyle(iOS6PlayerBtn())
                            
                            Button {} label: {
                                ZStack {
                                    Image(systemName: "shuffle")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.black.opacity(0.4))
                                        .shadow(color: Color(UIColor.white.withAlphaComponent(0.5)), radius: 0, x: 0, y: 1)
                                        .shadow(color: Color(UIColor.black.withAlphaComponent(0.3)), radius: 0, x: 0, y: -1)
                                    VStack {
                                        Rectangle()
                                            .fill(Color(UIColor.white.withAlphaComponent(0.8)))
                                            .frame(height: 1.5)
                                        Spacer()
                                        Rectangle()
                                            .fill(Color(UIColor.black.withAlphaComponent(0.3)))
                                            .frame(height: 1.5)
                                    }
                                }
                            }.buttonStyle(iOS6PlayerBtn())
                            
                        }
                        .padding(.leading, 3)
                        .padding(.trailing, 3)
                        .padding(.vertical, 3)
                        /*.background(LinearGradient(
                         gradient: Gradient(stops: [
                         Gradient.Stop(color: Color(red: 117/255, green: 117/255, blue: 117/255), location: 0),
                         Gradient.Stop(color: Color(red: 48/255, green: 48/255, blue: 48/255), location: 0.01),
                         Gradient.Stop(color: Color(red: 20/255, green: 20/255, blue: 20/255), location: 0.5),
                         Gradient.Stop(color: Color(red: 117/255, green: 117/255, blue: 117/255), location: 1)
                         ]), startPoint: .top, endPoint: .bottom
                         ))*/
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .frame(width: 250 , height: 66)
                    .padding(.top, 20)
                    
                    Spacer()
                    iOS6Slider(value: $scroller)
                    //iOS6Slider(value: model.musicPlayer.currentPlaybackTime)
                        .frame(height: 10)
                        .padding(.horizontal, 30)
                        //.padding(.top, 50)
                    Spacer()
                }
                
            }
            .frame(height: 180)
            .background(LinearGradient(gradient: Gradient(
                stops: [
                    Gradient.Stop(color: Color(red: 33/255, green: 33/255, blue: 33/255), location: 0),
                    Gradient.Stop(color: Color(red: 3/255, green: 3/255, blue: 3/255), location: 1)
                ]
            ), startPoint: .top, endPoint: .bottom))
            
            Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
}

//Slider(value: $volume, in: 0...1,step: 0.0625, onEditingChanged: { data in
//    MPVolumeView.setVolume(self.volume)
//})

extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

extension View {
    func gradientborder(width: CGFloat, edges: [Edge], LinearGradient: LinearGradient) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundStyle(LinearGradient))
    }
}

struct EdgeBorder: Shape {
    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        edges.map { edge -> Path in
            switch edge {
            case .top: return Path(.init(x: rect.minX, y: rect.minY, width: rect.width, height: width))
            case .bottom: return Path(.init(x: rect.minX, y: rect.maxY - width, width: rect.width, height: width))
            case .leading: return Path(.init(x: rect.minX, y: rect.minY, width: width, height: rect.height))
            case .trailing: return Path(.init(x: rect.maxX - width, y: rect.minY, width: width, height: rect.height))
            }
        }.reduce(into: Path()) { $0.addPath($1) }
    }
}

extension MPVolumeView {
    static func setVolume(_ volume: Float) -> Void {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = volume
        }
    }
}

