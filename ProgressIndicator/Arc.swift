//
//  Arc.swift
//  ProgressIndicator
//
//  Created by Karthick Selvaraj on 22/06/20.
//  Copyright © 2020 Mallow Technologies Private Limited. All rights reserved.
//

import SwiftUI

struct Arc: View {
    
    var progress: CGFloat
    var backgroundColor: Color = Color.secondary.opacity(0.2)
    var progressColor: Color = Color.green
    var animationTimeInterval: TimeInterval = 1
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.5, to: 1)
                .stroke(backgroundColor, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .bevel))
            Circle()
                .trim(from: 0.5, to: (progress / 2) + 0.5)
                .stroke(progressColor, style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .bevel))
                .animation(Animation.linear(duration: self.animationTimeInterval))
            Text("\(Int(self.progress * 100)) %")
                .font(.title)
                .bold()
        }
    }
    
}

struct Arc_Previews: PreviewProvider {
    static var previews: some View {
        Arc(progress: 0.0)
    }
}
