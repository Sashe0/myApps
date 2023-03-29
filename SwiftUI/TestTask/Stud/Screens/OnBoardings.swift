//
//  OnBoardings.swift
//  Stud
//
//  Created by Oleksandr Bodnar on 10.02.2023.
//

import Foundation
import SwiftUI

struct OnboardingView: View{
    @Binding var showOnboarding: Bool
    
    var body: some View{
        TabView{
//            firstOnboard(subtitle: "For these app i worked long time, hope you like it.",
//                         showsDismissButton: false,
//                         showOnboarding: $showOnboarding)
            
            firstOnboard(subtitle: "В цьому додатку Ви зможете переглянути групи послyг, послуги та працівників",
                         showsDismissButton: true,
                         showOnboarding: $showOnboarding)
            secondOnBoard()
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct firstOnboard: View{
    let subtitle: String
    let showsDismissButton: Bool
    @Binding var showOnboarding: Bool
    
    var body: some View{
        VStack{
            Spacer()
            Image("list")
                .resizable()
                .frame(width: 225.0, height: 400.0)
                .scaledToFit()
                .padding(.top, 168.5)
            
            Text(subtitle)
                .font(.custom("Exo2-Reqular", size: 17))
                .foregroundColor(Color(hue: 0.595, saturation: 0.434, brightness: 0.678))
                .padding(.bottom, 20)
                .padding(.top, 10)
                .padding(.horizontal, 40)
            
            Spacer()
            
            if showsDismissButton{
                Button(action: {
                    showOnboarding.toggle()
                }, label: {
                    Text("Let's start")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color(hue: 0.595, saturation: 0.434, brightness: 0.678))
                        .cornerRadius(15)
                })
            }
            Spacer()
            Spacer()
        }
    }
}

struct secondOnBoard: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Please, allow this app to send messages")
            
            Button("Request permission") {
                NotificationManager.instance.requestAuthorization()
            }
            .bold()
            .foregroundColor(Color.white)
            .frame(width: 200, height: 50)
            .background(Color(hue: 0.595, saturation: 0.434, brightness: 0.678))
            .cornerRadius(15)
            
        }
        .onAppear{
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
//        .onDisappear{
//            DispatchQueue.main.asyncAfter(deadline: .now() + 30){
//                NotificationManager.instance.cancelNotification()
//            }
//        }
    }
}
