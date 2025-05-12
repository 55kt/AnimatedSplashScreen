//
//  MainView.swift
//  AnimatedSplashScreen
//
//  Created by Vlad on 12/5/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.red, Color.purple], startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea(.all)
            
            Text("Main View")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .bold()
        }
    }
}

#Preview {
    MainView()
}
