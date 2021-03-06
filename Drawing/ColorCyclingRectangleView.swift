//
//  ColorCyclingRectangleView.swift
//  Drawing
//
//  Created by Davron on 12/29/19.
//  Copyright © 2019 Davron. All rights reserved.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var steps = 100
    var amount = 0.0
    
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + Double(self.amount)
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }

    
}

struct ColorCyclingRectangleView: View {
    
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: self.colorCycle)
                .drawingGroup()
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
    }
}

struct ColorCyclingRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCyclingRectangleView()
    }
}
