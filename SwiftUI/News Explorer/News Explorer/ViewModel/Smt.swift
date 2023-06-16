//
//  Smt.swift
//  News Explorer
//
//  Created by Саша on 15.06.2023.
//

import Foundation
//
//class Smt: ObservableObject {
//    @Published var arrayData: [articless] = []
//    
//    func getData(){
//        let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&pageSize=20&apiKey=f8a3f39f18084bf29fe64cf237c67f16")
//        
//        URLSession.shared.dataTask(with: url!) {(data, response, error) in
//            DispatchQueue.main.async { [self] in
//                do{
//                    if let data = data {
//                        let result = try JSONDecoder().decode(bitcoinArticles.self, from: data)
//                        arrayData = result.articles
//                    }
//                    else {
//                        print("No data")
//                    }
//                }catch (let error){
//                    print("Some error: \(error)")
//                    }
//            }
//        }.resume()
//    }
//}
