//
//  Circular.swift
//  ProgressIndicator
//
//  Created by Karthick Selvaraj on 22/06/20.
//  Copyright © 2020 Mallow Technologies Private Limited. All rights reserved.
//

import SwiftUI

struct Circular: View {
    
    var progress: CGFloat
    var backgroundColor: Color = Color.secondary.opacity(0.2)
    var progressColor: Color = Color.green
    var animationTimeInterval: TimeInterval = 1
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(backgroundColor, style: StrokeStyle(lineWidth: 20, lineCap: .round))
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.green, style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(Animation.linear(duration: self.animationTimeInterval))
                .overlay(
                    Text("\(Int(progress * 100)) %")
                        .font(.subheadline)
                        .bold()
                        .animation(nil)
                )
        }
    }
}

struct Circular_Previews: PreviewProvider {
    static var previews: some View {
        Circular(progress: 0.5)
    }
}
