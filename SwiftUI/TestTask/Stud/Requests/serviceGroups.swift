//
//  Users.swift
//  Stud
//
//  Created by Oleksandr Bodnar on 28.12.2022.
//

import Foundation

struct serviceGroups: Codable{               //NewsFeed- ServiceGroups

    var data: [Groups]                      //expected by myself ?

}

struct Groups: Identifiable, Codable{

    var id: Int
    let name: String
    let description: String?
    let style: String?

//    func SGtoString() -> String{
//        return "id: \(id ?? 0)"              /*, \(name ?? "-")" //id: \(id ?? 0)*/
//    }

}

