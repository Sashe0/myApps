//
//  ServicesScreen.swift
//  Stud
//
//  Created by Oleksandr Bodnar on 28.12.2022.
//

import Foundation
import SwiftUI


struct ServiceScreen: View {
    @EnvironmentObject var servic: Servs
    var bindingId: Int
    
    
    var body: some View {
        NavigationView {
            ZStack{
                NameGroups(bindingId: bindingId.self)
            }
        }
    }
    
    
    struct ServiceScreen_Previews: PreviewProvider {
        static var previews: some View {
            ServiceScreen( bindingId: 0)
                .environmentObject(Servs())
        }
    }
    
    struct NameGroups: View {
        @EnvironmentObject var servic: Servs
        var bindingId: Int
        
        var body: some View {
            NavigationView{
                ScrollView {
                    Text("ПОСЛУГИ")
                        .font(.custom("Exo2-Medium", size: 30))
                        .foregroundColor(Color(hue: 0.595, saturation: 0.434, brightness: 0.678))
                        .padding(.vertical, 9.0)
                    
                    VStack(alignment: .leading) {
                        ForEach(servic.ser.filter({ preUserSC in
                            return preUserSC.service_group_id == bindingId})){
                                userSC in NavigationLink(destination: StaffScreen()
                                    .environmentObject(Staffs())){
                                        
                                    VStack(alignment: .leading){
                                        HStack{
                                            Text ("\(userSC.name)")
                                                .font(.custom("Exo2-Regular", size: 20))
                                                .foregroundColor(Color.white)
                                            //.foregroundColor(Color(hue: 0.57, saturation: 0.786, brightness: 0.476))
                                        }
                                        .padding(.bottom, 6.0)
                                            
                                        HStack(alignment: .top){
                                            Text("Тривалість: \(userSC.duration) хв" as String)
                                            Spacer()
                                            Text("\(userSC.price) \(userSC.currency)" as String)
                                                .frame(width: 110)
                                                .font(.custom("Exo2-Regular", size: 20))
                                                .background(Color.white)
                                                .cornerRadius(8)
                                                .foregroundColor(Color(hue: 0.597, saturation: 0.431, brightness: 0.83))
                                                .lineLimit(1)
                                        }
                                        .foregroundColor(Color.white)
                                        .font(.custom("Exo2-Light", size: 20))
                                    }
                                }
                                .frame(width: 300, alignment: .leading)
                                .padding()
                                .background(Color(hue: 0.597, saturation: 0.431, brightness: 0.83))
                                .cornerRadius(20)
                                .foregroundColor(.black)
                            }
                        }
                    }
                    .onAppear {
                        servic.getServices()
                }
            }
        }
    }
}
