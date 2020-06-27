//
//  FilledCircle.swift
//  ProgressIndicator
//
//  Created by Karthick Selvaraj on 22/06/20.
//  Copyright © 2020 Mallow Technologies Private Limited. All rights reserved.
//

import SwiftUI

struct FilledCircle: View {
    
    var radius: CGFloat
    var progress: CGFloat
    var backgroundColor: Color = Color.secondary.opacity(0.2)
    var progressColor: Color = Color.green
    var animationTimeInterval: TimeInterval = 1
    
    var body: some View {
        ZStack {
            Circle()
                .fill(backgroundColor)
                .frame(width: radius * 2, height: radius * 2, alignment: .center)
            FilledLoadingCircle(radius: radius, progress: Double(progress))
                .fill(progressColor)
                .animation(Animation.linear(duration: self.animationTimeInterval))
                .rotationEffect(.degrees(-90))
                .overlay(
                    Text("\(Int(progress * 100)) %")
                        .font(.subheadline)
                        .bold()
                        .animation(nil)
                )
        }
    }
    
}

struct FillCircle_Previews: PreviewProvider {
    static var previews: some View {
        FilledCircle(radius: 50, progress: 0.5)
    }
}

struct FilledLoadingCircle: Shape {
    
    var radius: CGFloat
    var progress: Double
    
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: radius, startAngle: .degrees(0), endAngle: .degrees(progress * 360), clockwise: false)
        return path
    }
}
