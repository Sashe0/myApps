//
//  GroupsScreen.swift
//  Stud
//
//  Created by Oleksandr Bodnar on 29.12.2022.
//

import Foundation
import SwiftUI


struct GroupScreen: View {
    @EnvironmentObject var groups: Grand
        @State var showOnboarding: Bool = true
//    @AppStorage("_showOnboarding") var showOnboarding: Bool = true
    
    var body: some View {
        NavigationView{
            ScrollView {
                Text("ГРУПИ ПОСЛУГ")
                    .font(.custom("Exo2-Medium", size: 30))
                    .foregroundColor(Color(hue: 0.595, saturation: 0.434, brightness: 0.678))
                    .padding(.vertical, 9.0)
                
                VStack(alignment: .leading) {
                    ForEach(groups.groups) { user in
                        NavigationLink("\(user.name)",
                                       destination: ServiceScreen(bindingId: user.id)
                            .environmentObject(Servs()))
                        
                        .font(.custom("Exo2-Reqular", size: 20))
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(width: 340, alignment: .leading)
                        .background(Color(hue: 0.597, saturation: 0.431, brightness: 0.83))
                        .cornerRadius(15)
                        .foregroundColor(.black)
                        .padding(.vertical, 1.0)
//                        .lineLimit(1)
//                        .allowsTightening(true)
                    }
                }
                .onAppear {
                    groups.getGroups()
                }
            }
        }.fullScreenCover(isPresented: $showOnboarding, content: {
            OnboardingView(showOnboarding: $showOnboarding)})
    }
    
    
    struct GroupScreen_Previews: PreviewProvider {
        static var previews: some View {
            GroupScreen()
                .environmentObject(Grand())
        }
    }
}


