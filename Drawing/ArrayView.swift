//
//  ArrayView.swift
//  Drawing
//
//  Created by Davron on 12/29/19.
//  Copyright © 2019 Davron. All rights reserved.
//

import SwiftUI

struct Array: Shape {
    var insetAmount: CGFloat
    
    
    var animatableData: CGFloat {
        get { insetAmount }
        set { insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY/2.5))
        path.addLine(to: CGPoint(x: rect.minX + insetAmount, y: rect.maxY/2.5))
        path.addLine(to: CGPoint(x: rect.minX + insetAmount, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.maxY/2.5))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY/2.5))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}
struct ArrayView: View {
    @State private var insetAmount: CGFloat = 50.0
    @State private var color = false
    @State private var thickness = false
    
    var body: some View {
        VStack {
            Array(insetAmount: insetAmount)
                .stroke(color ? Color.green : Color.red, style: StrokeStyle(lineWidth: thickness ? 10 : 20, lineCap: .round, lineJoin: .round))
                .frame(width: 200, height: 200)
                .onTapGesture {
                    withAnimation {
                        self.insetAmount = CGFloat.random(in: 20...60)
                        self.color.toggle()
                        self.thickness.toggle()
                    }
            }
            
                
        }
    }
}

struct ArrayView_Previews: PreviewProvider {
    static var previews: some View {
        ArrayView()
    }
}
