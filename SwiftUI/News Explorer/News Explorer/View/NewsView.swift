//
//  NewsView.swift
//  News Explorer
//
//  Created by Саша on 13.06.2023.
//

import SwiftUI

struct NewsView: View {
    @EnvironmentObject var groups: NewsViewModel
    
    @Binding var searchText: String
    @Binding var filtering: NewsViewModel.filterType

    var body: some View {
        NavigationView{
            ZStack{
                Color.black
                    .ignoresSafeArea()
            ScrollView {
                FiltersButtonModel(filtering: $groups.filtering)
                    VStack(alignment: .leading) {
                        ForEach(groups.searchResults ) { user in
                            NavigationLink(
                                destination: DetailView(filteredTitle: user.title)){
                                    VStack{
                                        Text("\(user.title)")
                                            .font(.headline)
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(2)
                                        Text("\(user.description ?? "")")
                                            .font(.subheadline)
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(3)
                                    }
                                }
                        }.foregroundColor(Color.white)
                            .padding()
                            .frame(width: 340, alignment: .leading)
                            .background(Color(hue: 0.745, saturation: 0.961, brightness: 0.634))
                            .cornerRadius(5)
                            .foregroundColor(Color(hue: 0.777, saturation: 1.0, brightness: 0.151))
                            .padding(.vertical, 4.0)
                    }
                    .onAppear {
                        groups.getData()
                    }
            }.foregroundColor(.white)
            }
        }.searchable(text: $groups.searchText, prompt: "Search (ex. 'words' or 2023-06-13)")
            .foregroundColor(.white)

    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(searchText: .constant(""), filtering: .constant(.none))
            .environmentObject(NewsViewModel())
    }
}
