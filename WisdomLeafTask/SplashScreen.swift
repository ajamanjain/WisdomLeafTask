//
//  SplashScreen.swift
//  WisdomLeafTask
//
//  Created by Aman Jain on 14/05/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct SplashScreen: View {
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if isActive{
                HomeView()
            }
            else{
                Color.white // Set the background color to white
                
                Image("wisdomLeaf") // Replace "your_image_name" with the actual name of your image asset
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200) // Adjust the frame size as needed
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                // Perform any necessary tasks after the splash screen duration
                // For example, navigate to the main screen or present a login view
                self.isActive = true
            }
        }
    }
}
