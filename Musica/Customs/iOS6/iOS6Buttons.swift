//
//  iOS6Buttons.swift
//  Musica
//
//  Created by Miguel on 17/12/23.
//

import SwiftUI

struct iOS6ListBtn: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 52)
            .foregroundColor(configuration.isPressed ? .white : Color(red: 55/225, green: 55/225, blue: 55/225))
            .background(!configuration.isPressed ?
                        LinearGradient(gradient: Gradient(colors: [
                            Color(red: 227/255, green: 229/255, blue: 232/255),
                            Color(red: 227/255, green: 229/255, blue: 232/255)]), startPoint: .top, endPoint: .bottom) :
                            LinearGradient(gradient: Gradient(colors: [
                                        Color(red: 60/255, green: 135/255, blue: 234/255),
                                        Color(red: 38/255, green: 91/255, blue: 222/255)]), startPoint: .top, endPoint: .bottom))
    }
}

struct iOS6Btn: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 30)
            .foregroundColor(configuration.isPressed ? .white : Color(red: 55/255, green: 55/255, blue: 55/255))
            .background(!configuration.isPressed ?
                        LinearGradient(gradient: Gradient(colors: [
                            Color(red: 227/255, green: 229/255, blue: 232/255),
                            Color(red: (227-50)/255, green: (229-50)/255, blue: (232-50)/255)
                        ]), startPoint: .top, endPoint: .bottom) :
                            LinearGradient(gradient: Gradient(colors: [
                                        Color(red: 60/255, green: 135/255, blue: 234/255),
                                        Color(red: 38/255, green: 91/255, blue: 222/255)]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(color: Color(UIColor.black.withAlphaComponent(0.3)), radius: 0, x: 0, y: -1)
            .shadow(color: Color(UIColor.white.withAlphaComponent(0.5)), radius: 0, x: 0, y: 1)
    }
}

struct iOS6PlayerBtn: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 60, height: 60)
            .foregroundColor(configuration.isPressed ? .white : Color(red: 55/255, green: 55/255, blue: 55/255))
            .background(!configuration.isPressed ?
                        LinearGradient(gradient: Gradient(colors: [
                            Color(red: 227/255, green: 229/255, blue: 232/255),
                            Color(red: (227-50)/255, green: (229-50)/255, blue: (232-50)/255)
                        ]), startPoint: .top, endPoint: .bottom) :
                            LinearGradient(gradient: Gradient(colors: [
                                        Color(red: 60/255, green: 135/255, blue: 234/255),
                                        Color(red: 38/255, green: 91/255, blue: 222/255)]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(color: Color(UIColor.black.withAlphaComponent(0.5)), radius: 2, x: 0, y: 1)
            //.shadow(color: Color(UIColor.white.withAlphaComponent(0.5)), radius: 0, x: 0, y: -1)
    }
}
