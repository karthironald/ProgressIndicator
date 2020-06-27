//
//  ContentView.swift
//  ProgressIndicator
//
//  Created by Karthick Selvaraj on 20/06/20.
//  Copyright © 2020 Mallow Technologies Private Limited. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var timer = Timer.publish(every: 0.1, on: .main, in: .default).autoconnect()
    @State var progress: CGFloat = 0.0
    @State var circularProgress: Double = 0.0
    
    var body: some View {
        Circular(progress: progress, animationTimeInterval: 0.1)
            .padding()
            .frame(width: 300, height: 300, alignment: .center)
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




