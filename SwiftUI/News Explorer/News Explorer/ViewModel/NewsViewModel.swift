//
//  NewsViewModel.swift
//  News Explorer
//
//  Created by Саша on 15.06.2023.
//

import Foundation
import SwiftUI

class NewsViewModel: ObservableObject{
    @Published var arrayData: [articless] = []
    @Published var searchText: String = ""
    @Published var filtering: filterType = .none
    enum filterType {
        case none, author, publishedAt, title
    }
    
    var filteredArticles: [articless] {
        
        switch filtering {
        case .none:
            return arrayData
            
        case .author:
            return arrayData.sorted { $0.author ?? "" < $1.author ?? ""}
            
        case .publishedAt:
            return arrayData.sorted { $0.publishedAt > $1.publishedAt}
            
        case .title:
            return arrayData.sorted { $0.title < $1.title}
        }
    }
    
    var searchResults: [articless] {
        if searchText.isEmpty {
            return filteredArticles
        } else {
            return filteredArticles.filter { ($0.publishedAt.contains(searchText) || $0.title.contains(searchText))}
        }
    }
    
    
    func getData(){
        let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&pageSize=20&apiKey=f8a3f39f18084bf29fe64cf237c67f16")
        
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
            DispatchQueue.main.async { [self] in
                do{
                    if let data = data {
                        let result = try JSONDecoder().decode(bitcoinArticles.self, from: data)
                        arrayData = result.articles
                    }
                    else {
                        print("No data")
                    }
                }catch (let error){
                    print("Some error: \(error)")
                    }
            }
        }.resume()
    }
}
