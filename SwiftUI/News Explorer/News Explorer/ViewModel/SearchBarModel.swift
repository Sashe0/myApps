//
//  SearchBarModel.swift
//  News Explorer
//
//  Created by Саша on 16.06.2023.
//

import SwiftUI

struct SearchBarModel: View {
    
    @Binding var searchText: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SearchBarModel_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarModel(searchText: .constant(""))
    }
}
