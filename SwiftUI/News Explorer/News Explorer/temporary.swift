//
//  temporary.swift
//  News Explorer
//
//  Created by Саша on 14.06.2023.
//

import Foundation
import SwiftUI

struct ReContentView: View {
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink {
                        Text(name)
                    } label: {
                        Text(name)
                    }
                }
            }
            .navigationTitle("Contacts")
        }
        .searchable(text: $searchText)
    }

    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}


struct DReContentView_Previews: PreviewProvider {
    static var previews: some View {
        ReContentView()
    }
}
