//
//  NabBar6.swift
//  Musica
//
//  Created by Miguel on 17/12/23.
//

import SwiftUI
import MediaPlayer

struct iOS6NavBar: View {
    
    let title: String
    @EnvironmentObject var model: Model
    @State private var path = NavigationPath()
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(.black)
                .frame(height: 51)
            ZStack {
                Rectangle()
                    .fill(.black)
                    .frame(height: 52)
                ZStack {
                    VStack {
                        Rectangle()
                            .fill(Color(UIColor.white.withAlphaComponent(0.24)))
                            .frame(height: 1)
                        Spacer()
                        Rectangle()
                            .fill(Color(UIColor.black.withAlphaComponent(0.12)))
                            .frame(height: 1)
                    }
                    HStack {
                        Button {
                            path.removeLast()
                        } label: {
                            Text("Atras")
                                .font(Font.custom("Helvetica Neue", size: 12))
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.horizontal, 10)
                        }
                        .buttonStyle(iOS6NavBarBlackBtnStyle())
                        Spacer()
                        Text("\(title)")
                            .foregroundColor(.white)
                            .font(Font.custom("Helvetica Neue", size: 20))
                            .fontWeight(.bold)
                            .shadow(color: Color(UIColor.black.withAlphaComponent(0.32)), radius: 0, x: 0, y: -1.5)
                        Spacer()
                        Button {
                            model.isPlayerOpen.toggle()
                        } label: {
                            Text("Ahora\nsuena")
                                .font(Font.custom("Helvetica Neue", size: 12))
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.horizontal, 10)
                        }
                        .buttonStyle(iOS6NavBarBlackBtnStyle())
                    }.padding(.horizontal, 10)
                }
                .frame(height: 52)
                .background(LinearGradient(gradient: Gradient(colors: [Color(hex: 0xBECBDD), Color(hex: 0x587397)]), startPoint: .top, endPoint: .bottom))
                .zIndex(5.0)
                .clipShape(
                    .rect(
                        topLeadingRadius: 10,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 10,
                        style: .continuous
                    )
                ).shadow(color: Color(UIColor.black.withAlphaComponent(0.5)), radius: 4, x: 0, y: 1)
            }
        }
    }
}

struct iOS6NavBarBlackBtnStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 60, height: 32, alignment: .center)
            .background(LinearGradient(colors: [
                Color(red: 25/255, green: 25/255, blue: 25/255),
                Color(red: 16/255, green: 16/255, blue: 16/255)
            ], startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            //.clipShape(iOS6NavBarPointingBtnShape())
            .cornerRadius(5)
            .shadow(color: Color(UIColor.white.withAlphaComponent(0.32)), radius: 0, x: 0, y: 1)
            .shadow(color: Color(UIColor.black.withAlphaComponent(0.32)), radius: 0, x: 0, y: -1)
    }
    
}

struct iOS6NavBarPointingBtnShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let width: CGFloat = 60
            let height: CGFloat = 34
            
            path.move(
                to: CGPoint(
                    x: 0.1 * width,
                    y: 0 * height
                )
            )

            path.addLine(
                to: CGPoint(
                    x: 0.75 * width,
                    y: 0 * height
                )
            )

            path.addCurve(
                to: CGPoint(
                    x: 1 * width,
                    y: 0.5 * height
                ),
                control1: CGPoint(
                    x: 0.8 * width,
                    y: 0 * height
                ),
                control2: CGPoint(
                    x: 0.8 * width,
                    y: 0 * height
                )
            )
            
            path.addCurve(
                to: CGPoint(
                    x: 0.75 * width,
                    y: 1 * height
                ),
                control1: CGPoint(
                    x: 0.8 * width,
                    y: 1 * height
                ),
                control2: CGPoint(
                    x: 0.8 * width,
                    y: 1 * height
                )
            )
            
            path.addLine(
                to: CGPoint(
                    x: 0.1 * width,
                    y: 1 * height)
            )
            
            path.addCurve(
                to: CGPoint(
                    x: 0 * width,
                    y: 0.9 * height
                ),
                control1: CGPoint(
                    x: 0 * width,
                    y: 1 * height
                ),
                control2: CGPoint(
                    x: 0 * width,
                    y: 1 * height
                )
            )
            
            path.addLine(
                to: CGPoint(
                    x: 0 * width,
                    y: 0.1 * height)
            )
            
            path.addCurve(
                to: CGPoint(
                    x: 0.1 * width,
                    y: 0 * height
                ),
                control1: CGPoint(
                    x: 0 * width,
                    y: 0 * height
                ),
                control2: CGPoint(
                    x: 0 * width,
                    y: 0 * height
                )
            )
            path.closeSubpath()
        }
    }
}

struct iOS6BlackNavBar: View {
    
    @EnvironmentObject var model: Model
    
    var body: some View {
        let nowPlayingSong = model.playingSong
        VStack(spacing: 0) {
            ZStack {
                Rectangle().fill(.black).frame(height: 52)
                ZStack {
                    VStack {
                        Rectangle().fill(Color(UIColor.white.withAlphaComponent(0.24))).frame(height: 1)
                        Spacer()
                        Rectangle().fill(Color(UIColor.black.withAlphaComponent(0.12))).frame(height: 1)
                    }
                    VStack {
                        Text(nowPlayingSong?.artist ?? "Artista")
                            .font(Font.custom("Helvetica Neue", size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .opacity(0.4)
                        Text(nowPlayingSong?.title ?? "No playing")
                            .foregroundColor(.white)
                            .font(Font.custom("Helvetica Neue", size: 15))
                            .fontWeight(.bold)
                        Text(nowPlayingSong?.albumTitle ?? "Album")
                            .font(Font.custom("Helvetica Neue", size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .opacity(0.4)
                    }
                }
                .frame(height: 52)
                .background(LinearGradient(gradient: Gradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 33/255, green: 33/255, blue: 33/255), location: 0),
                        Gradient.Stop(color: Color(red: 3/255, green: 3/255, blue: 3/255), location: 1)
                    ]
                ), startPoint: .top, endPoint: .bottom))
                .shadow(color: Color(UIColor.black.withAlphaComponent(0.5)), radius: 4, x: 0, y: 1)
            }
        }
    }
}

struct iOS6WoodNavBar: View {
    
    let title: String
    @EnvironmentObject var model: Model
    @State private var path = NavigationPath()
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(.black)
                .frame(height: 51)
            ZStack {
                Rectangle()
                    .fill(.black)
                    .frame(height: 52)
                ZStack {
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(Color(UIColor.white.withAlphaComponent(0.24)))
                            .frame(height: 1)
                        Rectangle()
                            .fill(Color(red: 153/255, green: 102/255, blue: 51/255).opacity(0.5))
                        Rectangle()
                            .fill(Color(UIColor.black.withAlphaComponent(0.32)))
                            .frame(height: 1)
                    }
                    HStack {
                        Button {
                            path.removeLast()
                        } label: {
                            Text("Atras")
                                .font(Font.custom("Helvetica Neue", size: 12))
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.horizontal, 10)
                        }
                        .buttonStyle(iOS6NavBarBlackBtnStyle())
                        Spacer()
                        Text("\(title)")
                            .foregroundColor(.white)
                            .font(Font.custom("Helvetica Neue", size: 20))
                            .fontWeight(.bold)
                            .shadow(color: Color(UIColor.black.withAlphaComponent(0.32)), radius: 0, x: 0, y: -1.5)
                        Spacer()
                        Button {
                            model.isPlayerOpen.toggle()
                        } label: {
                            Text("Ahora\nsuena")
                                .font(Font.custom("Helvetica Neue", size: 12))
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.horizontal, 10)
                        }
                        .buttonStyle(iOS6NavBarBlackBtnStyle())
                        
                    }.padding(.horizontal, 10)
                }
                .frame(height: 52)
                .background(Image("Wood").resizable().scaledToFill())
                .zIndex(5.0)
                .clipShape(
                    .rect(
                        topLeadingRadius: 10,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 10,
                        style: .continuous
                    )
                ).shadow(color: Color(UIColor.black.withAlphaComponent(0.5)), radius: 4, x: 0, y: 1)
            }
        }
    }
}


struct PlayerGlass: View {
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            Gradient.Stop(color: Color(red: 0/255, green: 0/255, blue: 0/255), location: 0),
                            Gradient.Stop(color: Color(red: 255/255, green: 255/255, blue: 255/255).opacity(0.5), location: 0.5),
                            Gradient.Stop(color: Color(red: 0/255, green: 0/255, blue: 0/255), location: 1)
                        ]), startPoint: .leading, endPoint: .trailing
                    )
                )
                .frame(height: 1)
            Spacer()
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            Gradient.Stop(color: Color(red: 0/255, green: 0/255, blue: 0/255), location: 0),
                            Gradient.Stop(color: Color(red: 255/255, green: 255/255, blue: 255/255).opacity(0.5), location: 0.5),
                            Gradient.Stop(color: Color(red: 0/255, green: 0/255, blue: 0/255), location: 1)
                        ]), startPoint: .leading, endPoint: .trailing
                    )
                )
                .frame(height: 1)
                .padding(.all, 0)
            Rectangle()
                .fill(.black)
                .frame(height: 1)
                .padding(.all, 0)
        }
    }
}
