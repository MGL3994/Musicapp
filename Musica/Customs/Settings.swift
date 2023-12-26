//
//  Settings.swift
//  Settings
//
//  Created by Jordan Singer on 2/20/21.
//

import SwiftUI

struct Settings: View {
    var body: some View {
            VStack(spacing: 0) {
                // status bar
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: 0x516B8A), Color(hex: 0x405D7F)]), startPoint: .top, endPoint: .bottom))
                    .frame(height: 44)
                
                // navigation bar
                ZStack {
                    VStack {
                        Rectangle()
                            .fill(Color(UIColor.white.withAlphaComponent(0.24)))
                            .frame(height: 1.5)
                        Spacer()
                        Rectangle()
                            .fill(Color(UIColor.black.withAlphaComponent(0.12)))
                            .frame(height: 1)
                    }
                    
                    ZStack {
                        Text("Settings")
                            .foregroundColor(Color(UIColor.black.withAlphaComponent(0.32)))
                            .font(Font.custom("Helvetica Neue", size: 20))
                            .fontWeight(.bold)
                            .offset(x: 0, y: -1.5)
                        
                        Text("Settings")
                            .foregroundColor(.white)
                            .font(Font.custom("Helvetica Neue", size: 20))
                            .fontWeight(.bold)
                    }
                    
                }
                .frame(height: 52)
                .background(LinearGradient(gradient: Gradient(colors: [Color(hex: 0xBECBDD), Color(hex: 0x587397)]), startPoint: .top, endPoint: .bottom))
                .shadow(color: Color(UIColor.black.withAlphaComponent(0.08)), radius: 4, x: 0, y: 2)
                
                // settings lists
                ScrollView {
                    ZStack {
                        HStack(alignment: .top, spacing: 8) {
                            ForEach(0..<48) { i in
                                Rectangle()
                                    .frame(width: 3, height: 812)
                                    .foregroundColor(Color.black.opacity(0.02))
                            }
                        }
                        .frame(width: 375)

                        VStack {
                            Grouping(content: {
                                VStack(spacing: 0) {
                                    Setting(background: Color.black, foreground: Color.orange, icon: "airplane", text: "Airplane Mode")
                                    Setting(background: Color.gray, foreground: Color.white, icon: "wifi", text: "Wi-Fi")
                                    Setting(background: Color.gray, foreground: Color.white, icon: "personalhotspot", text: "Personal Hotspot", lastRow: true)
                                }
                            })
                            
                            
                            Grouping(content: {
                                VStack(spacing: 0) {
                                    Setting(background: Color(hex: 0x26164F), foreground: Color.white, icon: "moon.fill", text: "Do Not Disturb")
                                    Setting(background: Color(hex: 0xCD3C36), foreground: Color.white, icon: "bell.fill", text: "Notifications", lastRow: true)
                                }
                            })
                            
                            Grouping(content: {
                                VStack(spacing: 0) {
                                    Setting(background: Color.gray, foreground: Color.white, icon: "gear", text: "General")
                                    Setting(background: Color(hex: 0x4E68A6), foreground: Color.white, icon: "speaker.wave.3.fill", text: "Sounds")
                                    Setting(background: Color.black, foreground: Color.orange, icon: "sun.max.fill", text: "Brightness & Wallpaper")
                                    Setting(background: Color.black, foreground: Color.white, icon: "hand.raised.fill", text: "Privacy", lastRow: true)
                                }
                            })
                            
                            Grouping(content: {
                                VStack(spacing: 0) {
                                    Setting(background: Color.gray, foreground: Color.white, icon: "icloud.fill", text: "iCloud")
                                    Setting(background: Color.blue, foreground: Color.white, icon: "tray.fill", text: "Mail, Contacts, Calendars")
                                    Setting(background: Color.green, foreground: Color.white, icon: "message.fill", text: "Messages")
                                    Setting(background: Color.blue, foreground: Color.white, icon: "safari.fill", text: "Safari", lastRow: true)
                                }
                            })
                        }
                    
                    }
                    
                }
                .background(Color(hex: 0xD8DBE5))
            }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Grouping<Content:View>: View {
    let content: () -> Content
    
    var body: some View {
        content()
        .background(
            ZStack(alignment: .top) {
                
                Color(hex: 0xF7F7F7)
                
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.1), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom))
                    .frame(height: 3)
                    
            }
        )
        .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: 0xB7B9BD), lineWidth: 1)
                    .padding(.bottom, 1.5)
                    )
            .padding(.bottom)
            .padding(.horizontal)
    }
}

struct Setting: View {
    var background: Color
    var foreground: Color
    var icon: String
    var text: String
    var lastRow = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                VStack {
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(foreground)
                        .frame(width: 18, height: 18)
                }
                .frame(width: 30, height: 30)
                .background(background.overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.4), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom))
                ))
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white.opacity(0.24)]), startPoint: .top, endPoint: .bottom), lineWidth: 0.5)
                        .padding(1)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black.opacity(0.32), lineWidth: 1)
                )
                .overlay(
                    ZStack {
                        Circle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.white.opacity(0.32)]), startPoint: .top, endPoint: .bottom))
                            .frame(width: 60, height: 60)
                            .offset(x: 0, y: -30)
                    }
                    .frame(width: 28, height: 28)
                    .cornerRadius(5)
                    .clipped()
                    
                    
                )
                
                Text(text)
                    .foregroundColor(.black)
                    .font(Font.custom("Helvetica Neue", size: 18))
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color.gray)
                    .padding(.trailing, 4)
            }
            .padding(10)
            
            if !lastRow {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(hex: 0xB7B9BD))
            }
        }
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
