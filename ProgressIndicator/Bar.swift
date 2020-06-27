//
//  Bar.swift
//  ProgressIndicator
//
//  Created by Karthick Selvaraj on 22/06/20.
//  Copyright © 2020 Mallow Technologies Private Limited. All rights reserved.
//

import SwiftUI

struct Bar: View {
    
    var progress: CGFloat
    var backgroundColor: Color = Color.secondary.opacity(0.2)
    var progressColor: Color = Color.green
    var animationTimeInterval: TimeInterval = 1
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0) {
                Text("\(Int(self.progress * 100)) %")
                    .font(.subheadline)
                    .bold()
                    .animation(nil)
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(self.backgroundColor)
                        .frame(width: geo.size.width, height: 20)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(self.progressColor)
                        .frame(width: (geo.size.width) * (self.progress), height: 15)
                        .animation(Animation.linear(duration: self.animationTimeInterval))
                }
            }
        }
    }
}

struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        Bar(progress: 0.5)
    }
}
