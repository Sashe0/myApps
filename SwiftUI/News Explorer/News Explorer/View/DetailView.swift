//
//  DetailView.swift
//  News Explorer
//
//  Created by Саша on 14.06.2023.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var stafic: NewsViewModel /*NewsViewModel*/
    var filteredTitle: String
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(stafic.arrayData.filter({ filtered in
                            return filtered.title == filteredTitle})) { people in
                                VStack(alignment: .leading){
                                    Text(people.title)
                                        .font(.title)
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text(people.publishedAt)
                                    
                                        .foregroundColor(Color(hue: 1.0, saturation: 0.005, brightness: 0.666))
                                        .multilineTextAlignment(.leading)
                                    
                                    HStack{
                                        AsyncImage(url: URL(string: people.urlToImage ?? "")) { Image in
                                            Image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .scaledToFit()
                                                .cornerRadius(5.0)
                                        }
                                    placeholder: {
                                        Image(systemName: "photo")
                                            .resizable()
                                            .frame(width: 190, height: 150)
                                            .scaledToFit()
                                        .foregroundColor(Color.blue)}
                                    }
                                    VStack(alignment: .leading) {
                                        
                                        Text(people.description ?? "")
                                            .font(.title2)
                                        Spacer()
                                        HStack{
                                            Text(people.author ?? "no author")
                                                .font(.title)
                                                .fontWeight(.medium)
                                                .foregroundColor(Color(hue: 1.0, saturation: 0.005, brightness: 0.666))
                                            Spacer()
                                            VStack{
                                                Text(people.source.name ?? "").font(.callout)
                                                Text(people.source.id ?? "-").font(.footnote)
                                            }
                                            .foregroundColor(Color(hue: 1.0, saturation: 0.005, brightness: 0.666))
                                        }
                                        Spacer()
                                    }
                                    .foregroundColor(Color.white)
                                    .padding(.horizontal)
                                    Spacer()
                                }
                                .padding()
                                .frame(width: 340, alignment: .leading)
                                .background(Color(hue: 0.745, saturation: 0.961, brightness: 0.634))
                                .cornerRadius(5)
                                .foregroundColor(Color(hue: 0.777, saturation: 1.0, brightness: 0.151))
                                .padding(.vertical, 4.0)
                            }
                    }
                }
                .padding(.vertical)
                .onAppear {
                    stafic.getData()
                }
            }
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView( filteredTitle: "")
            .environmentObject(NewsViewModel()) /*NewsViewModel*/
    }
}
