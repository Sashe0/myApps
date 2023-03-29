//
//  SplashScreen.swift
//  Stud
//
//  Created by Oleksandr Bodnar on 10.02.2023.
//

import Foundation
import SwiftUI
import Alamofire

struct SplashScreenView: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var grand = Grand()
    
    var body: some View {
            if isActive {
                GroupScreen().environmentObject(grand)
            } else {
                VStack {
                    VStack {
                        Image("list")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250)
                            .font(.system(size: 10))
                            .foregroundColor(.red)
                            .padding()
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.00
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
    }
    
    struct SplashScreenView_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreenView()
        }
    }
}
