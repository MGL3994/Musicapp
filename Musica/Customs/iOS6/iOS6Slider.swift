//
//  Slider6.swift
//  Musica
//
//  Created by Miguel on 17/12/23.
//

import SwiftUI

struct iOS6Slider: View {
    
    @Binding var value: Double
    @State var lastCoordinateValue: CGFloat = 0.0
    
    var thumbColor: AngularGradient = AngularGradient(gradient: Gradient(colors: [
        Color(red: 139/255, green: 139/255, blue: 139/255),
        Color(red: 192/255, green: 192/255, blue: 192/255),
        Color(red: 244/255, green: 244/255, blue: 244/255),
        Color(red: 192/255, green: 192/255, blue: 192/255),
        Color(red: 139/255, green: 139/255, blue: 139/255),
        Color(red: 192/255, green: 192/255, blue: 192/255),
        Color(red: 244/255, green: 244/255, blue: 244/255),
        Color(red: 192/255, green: 192/255, blue: 192/255),
        Color(red: 139/255, green: 139/255, blue: 139/255)
    ]), center: .center, angle: Angle(degrees: 45))
    
    var thumbBorder: AngularGradient = AngularGradient(gradient: Gradient(colors: [
        Color(red: 192/255, green: 192/255, blue: 192/255),
        Color(red: 244/255, green: 244/255, blue: 244/255),
        Color(red: 192/255, green: 192/255, blue: 192/255),
        Color(red: 244/255, green: 244/255, blue: 244/255),
        Color(red: 192/255, green: 192/255, blue: 192/255)
    ]), center: .center, angle: Angle(degrees: 45))
    
    var minTrackColor: LinearGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 246/255, green: 246/255, blue: 246/255),
            Color(red: 144/255, green: 144/255, blue: 144/255)
        ]), startPoint: .top, endPoint: .bottom
    )
    
    var maxTrackColor: LinearGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 117/255, green: 117/255, blue: 117/255),
            Color(red: 48/255, green: 48/255, blue: 48/255),
            Color(red: 20/255, green: 20/255, blue: 20/255)
        ]), startPoint: .top, endPoint: .bottom
    )
    
    var body: some View {
        
        let totalDuration: Double = 100
        var sliderRange: ClosedRange<Double> = 1...totalDuration
        
        
        GeometryReader { gr in
            let thumbHeight = 18.0
            let thumbWidth = 18.0
            let radius = gr.size.height * 0.5
            let minValue = gr.size.width * 0.015
            let maxValue = gr.size.width * 0.98
            
            let scaleFactor = (maxValue - minValue) / (sliderRange.upperBound - sliderRange.lowerBound)
            let lower = sliderRange.lowerBound
            let sliderVal = (self.value - lower) * scaleFactor + minValue
            
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(maxTrackColor)
                    .frame(width: gr.size.width, height: gr.size.height * 0.95)
                HStack {
                    Rectangle()
                        .fill(minTrackColor)
                        .frame(width: sliderVal, height: gr.size.height * 0.95)
                    Spacer()
                }
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
                HStack {
                    Circle()
                        .stroke(thumbBorder, lineWidth:2)
                        .fill(thumbColor)
                        .frame(width: thumbWidth, height: thumbHeight)
                        .shadow(color: Color(UIColor.black.withAlphaComponent(0.8)), radius: 4, x: 0, y: 0)
                        .offset(x: sliderVal - thumbWidth/2)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { v in
                                    if (abs(v.translation.width) < 0.1) {
                                        self.lastCoordinateValue = sliderVal
                                    }
                                    if v.translation.width > 0 {
                                        let nextCoordinateValue = min(maxValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = ((nextCoordinateValue - minValue) / scaleFactor)  + lower
                                    } else {
                                        let nextCoordinateValue = max(minValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = ((nextCoordinateValue - minValue) / scaleFactor) + lower
                                    }
                               }
                        )
                    Spacer()
                }
            }
        }
    }
}
