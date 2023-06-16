//
//  FiltersButtonModel.swift
//  News Explorer
//
//  Created by Саша on 16.06.2023.
//

import SwiftUI

struct FiltersButtonModel: View {
    
    @EnvironmentObject var groups: NewsViewModel
    @Binding var filtering: NewsViewModel.filterType
    
    var body: some View {
        HStack{
            Spacer()
            Button("ALL", action: {groups.filtering = .none})
            Spacer()
            Button("AUTHOR", action: {groups.filtering = .author})
            Spacer()
            Button("PUBLISHEDAT", action: {groups.filtering = .publishedAt})
            Spacer()
            Button("TITLE", action: {groups.filtering = .title})
            Spacer()
        }.foregroundColor(.white)
         .font(.body)
         .padding()
    }
}

struct FiltersButtonModel_Previews: PreviewProvider {
    static var previews: some View {
        FiltersButtonModel(filtering: .constant(.none))
    }
}
