//
//  CustomProgressView.swift
//  AnimatedSplashScreen
//
//  Created by Vlad on 12/5/25.
//

import SwiftUI

struct CustomProgressView: View {
    @Binding var progress: Double
    
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .fill(Color.white.opacity(0.25))
                .frame(height: 8)
            
            Capsule()
                .fill(
                    LinearGradient(colors: [Color.red, Color.purple], startPoint: .leading, endPoint: .trailing)
                )
                .frame(width: CGFloat(progress) * UIScreen.main.bounds.width * 0.8, height: 8)
        }
        .clipShape(Capsule())
    }
}
