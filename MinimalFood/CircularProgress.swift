//
//  CircularProgress.swift
//  MinimalFood
//
//  Created by Emanuele Bazzicalupo on 15/12/24.
//

import SwiftUI

struct CircularProgress: View {
    var progress: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white, lineWidth: 10)
            Circle()
                .trim(from: 0, to: CGFloat(self.progress))
                .stroke(Color.yellow, lineWidth: 15)
        }
        .rotationEffect(Angle(degrees: -90))
        .frame(width: 350, height: 350)
        .padding()
    }
}
