//
//  WelcomeScreen.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-12-13.
//

//
//  OnBordingScreen.swift
//  EmployeeApp
//
//  Created by Nimesha Jayathissa on 2023-12-08.
//



import Foundation
import SwiftUI

struct OnBoardingScreen: View {
    @State private var isOnboardingComplete = false
    //@AppStorage("isOnboardingComplete") var isOnboardingComplete = false
    
    var body: some View {
        if isOnboardingComplete {
            MainTabView()
        } else {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    Text("HappyDayz")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                    Spacer()
                    
                   
                    
                    Text("An app to manage contacts, allowing easy searching by name/nickname. Users can view contact details, set birthday reminders, and create notes for reminders.")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                        .padding(.bottom, 40)
                    
                    Text("")
                        .font(.caption)
                        .padding(.bottom, 40)
                    
                    Spacer()
                    
                    Button("Continue") {
                        isOnboardingComplete = true
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.bottom, 40)
                }
                .padding()
                .fullScreenCover(isPresented: $isOnboardingComplete) {
                    MainTabView()
                }
            }
        }}
}

    





