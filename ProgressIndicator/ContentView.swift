//
//  ContentView.swift
//  ProgressIndicator
//
//  Created by Karthick Selvaraj on 20/06/20.
//  Copyright © 2020 Mallow Technologies Private Limited. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var shouldAnimate: Bool = false
    var timer = Timer.publish(every: 0.5, on: .main, in: .default).autoconnect()
    @State var progress: CGFloat = 0.0
    @State var circularProgress: Double = 0.0
    
    var body: some View {
        FilledCircle(radius: 50, progress: progress, animationTimeInterval: 0.5)
            .padding()
            .onReceive(timer) { (_) in
                self.progress += 0.01
                if self.progress >= 1 {
                    self.timer.upstream.connect().cancel()
                }
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




