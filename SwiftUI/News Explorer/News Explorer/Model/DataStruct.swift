//
//  DataStruct.swift
//  News Explorer
//
//  Created by Саша on 13.06.2023.
//

struct bitcoinArticles: Codable{
    
    var articles: [articless]
}

struct articless: Identifiable, Codable{
    var id: String { title }
    
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {

    let id: String?
    let name: String?
}
