//
//  PreSplashScreen.swift
//  Stud
//
//  Created by Oleksandr Bodnar on 12.02.2023.
//

import Foundation
import SwiftUI
import Alamofire

struct PreSplashScreenView: View{
    @State var isActive : Bool = false
    @State var responseTime: Double = 0


    
    var body: some View{
        if isActive {
            SplashScreenView()
        } else {
            VStack {
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2)
                Spacer()
            }
            
            .onAppear {
                getTime()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2*(responseTime)) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
    func getTime(){
        AF.request("https://business-beauty.staging.eservia.com/api/v1.0/widget/service-groups?code=35CDFF1D10A64E9E91D4EA9C8B983DBC")
            .responseDecodable(of: serviceGroups.self) { response in
                let responsTime = (response.metrics?.taskInterval.duration ?? 0.13)
                responseTime = responsTime
                print(responseTime)
                
            }
    }
}

//Spacer()
//
//Text("\(responseTime)")
//    .animation(.easeInOut(duration: 0.2))
//    .foregroundColor(.black.opacity(0.80))





struct PreSplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        PreSplashScreenView()
    }
}
