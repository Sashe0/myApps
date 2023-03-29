//
//  PickerScreen.swift
//  Stud
//
//  Created by Oleksandr Bodnar on 11.02.2023.
//

import Foundation
import SwiftUI


struct PickerScreen: View {
    @EnvironmentObject var groups: Grand
    
    var body: some View {
        ScrollView<PickerScreen>{
            Picker<Text, <#SelectionValue: Hashable#>, <#Content: View#>>(selection: groups, label: Text("smt"), content: PickerScreen)
//            ScrollView {
//                Text("Групи послуг")
//                    .font(.largeTitle)
//                    .bold()
//
//                VStack(alignment: .leading) {
//                    ForEach(groups.groups) { user in
//                        NavigationLink("\(user.name)",
//                            destination: ServiceScreen(bindingId: user.id)
//                                        .environmentObject(Servs()))
//                        .fontWeight(.medium)
//                        .font(.title3)
//
//
//                            .padding()
//                            .frame(width: 300, alignment: .leading)
//                            .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
//                            .cornerRadius(15)
//                            .foregroundColor(.black)
//                            .padding(.top)
//
//                    }
//                }
//                .onAppear {
//                    groups.getGroups()
//                }
//            }
        }
    }
    
    
    struct PickerScreen_Previews: PreviewProvider {
        static var previews: some View {
            PickerScreen()
        }
    }
}
