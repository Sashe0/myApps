//
//  News_ExplorerApp.swift
//  News Explorer
//
//  Created by Саша on 13.06.2023.
//

import SwiftUI

@main
struct News_ExplorerApp: App {
//    var grand = GroupScreen(filtering: .none)
    
    
    var body: some Scene {
        WindowGroup {
//            GroupScreen(filtering: .none)
//                .environmentObject(NewsViewModel())
            NewsView(searchText: .constant(""), filtering: .constant(.none))
                .environmentObject(NewsViewModel())
        }
    }
}
