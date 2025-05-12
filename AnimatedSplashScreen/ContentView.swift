//
//  ContentView.swift
//  AnimatedSplashScreen
//
//  Created by Vlad on 12/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    @State private var scaleEffect: CGFloat = 0.9
    @State private var opacityEffect: Double = 0.5
    @State private var progress = 0.0
    
    var body: some View {
        if isActive {
            MainView()
        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
                
                VStack {
                    Spacer()
                    Image("lens")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 170, height: 170)
                        .foregroundStyle(.white)
                        .scaleEffect(scaleEffect)
                        .opacity(opacityEffect)
                        .onAppear {
                            animateIcon()
                        }
                        .padding(.bottom, 50)
                    
                    Spacer()
                    CustomProgressView(progress: $progress)
                        .frame(height: 6)
                        .padding(.horizontal, 50)
                    
                    Text("Loading...")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding(.top, 8)
                        .padding(.bottom, 50)
                }
            }
            .onAppear {
                startProgress()
            }
        }
    }
    
    private func animateIcon() {
        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
            scaleEffect = 1.0
            opacityEffect = 1.0
        }
    }
    
    private func startProgress() {
        withAnimation(.linear(duration: 3.0)) {
            progress = 1.0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation(.easeInOut(duration: 0.5)) {
                isActive = true
            }
        }
    }
}

#Preview {
    ContentView()
}
