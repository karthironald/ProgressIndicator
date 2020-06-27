//
//  FillCircle.swift
//  ProgressIndicator
//
//  Created by Karthick Selvaraj on 22/06/20.
//  Copyright © 2020 Mallow Technologies Private Limited. All rights reserved.
//

import SwiftUI

struct FilledCircle: View {
    
    var timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    @State var circularProgress: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.secondary.opacity(0.2))
                .frame(width: 100)
            LoadingCircle(radius: 50, progress: circularProgress)
                .fill(Color.green)
                .frame(width: 100)
                .animation(Animation.linear(duration: 1))
                .rotationEffect(.degrees(-90))
                .onReceive(timer) { (_) in
                    self.circularProgress += 0.1
                    if self.circularProgress == 1 {
                        self.timer.upstream.connect().cancel()
                    }
            }
        }
    }
}

struct FillCircle_Previews: PreviewProvider {
    static var previews: some View {
        FilledCircle()
    }
}

struct LoadingCircle: Shape {
    
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
