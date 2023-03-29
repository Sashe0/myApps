//
//  StaffScreen.swift
//  Stud
//
//  Created by Oleksandr Bodnar on 29.12.2022.
//

import Foundation
import SwiftUI


struct StaffScreen: View {
    @EnvironmentObject var stafic: Staffs
    
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView {
                    Text("ПРАЦІВНИКИ")
                        .font(.custom("Exo2-Medium", size: 30))
                        .foregroundColor(Color(hue: 0.595, saturation: 0.434, brightness: 0.678))
                        .padding(.vertical, 9.0)
                    
                    VStack(alignment: .leading) {
                        ForEach(stafic.star) { people in
                            
                            HStack{
                                
                                //button
//                                 Button("✅") {
//                                     NotificationManager.instance.scheduleNotification()
//                                     print("Pressed")
//                                 }
                                
                                VStack(alignment: .leading) {
                                    Button(people.first_name ?? ""){
                                        NotificationManager.instance.scheduleNotification()
                                    }
//                                    Text(people.first_name ?? "")
                                        .font(.custom("Exo2-Regular", size: 20))
                                    Text(people.last_name ?? "")
                                        .font(.custom("Exo2-Regular", size: 20))
                                    Spacer()
                                    Text(people.position ?? "")
                                        .font(.custom("Exo2-Light", size: 20))
                                    Spacer()
                                }
                                .foregroundColor(Color.white)
                                .padding(.horizontal)
                                Spacer()
                                    
                                AsyncImage(url: URL(string: people.photo ?? "")) { Image in
                                    Image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(width: 110, height: 110)
                                    .scaledToFit()
                                    }
                                placeholder: {
                                    Image(systemName: "person.circle")
                                    .resizable()
                                    .frame(width: 110, height: 110)
                                    .scaledToFit()
                                    .foregroundColor(Color.blue)
                                    }
                                }
                            .frame(width: 300, alignment: .leading)
                            .padding()
                            .background(Color(hue: 0.597, saturation: 0.431, brightness: 0.83))
                            .cornerRadius(20)
                        }
                    }
                    
                }
                .padding(.vertical)
                .onAppear {
                    stafic.getStaffs()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}


struct StaffScreen_Previews: PreviewProvider {
    static var previews: some View {
        StaffScreen()
            .environmentObject(Staffs())
    }
}

