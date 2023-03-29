//
//  ServiceGroups.swift
//  OneMore
//
//  Created by Oleksandr Bodnar on 01.09.2022.
//

import Foundation

final class SGCaller {
    static let shared = SGCaller()
    
    struct Constants {
        static let sgURL = URL(string:  "https://business-beauty.staging.eservia.com/api/v1.0/widget/service-groups?code=35CDFF1D10A64E9E91D4EA9C8B983DBC")
    }
    
    private init() {}
    
    
    public func getGropus (completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = Constants.sgURL else {
            return
        }
        
        let task = URLSession.shared.dataTask (with: url) {data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(serviceGroups.self, from: data)
                    
                    print(result)
                    completion(.success(result.data))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

struct serviceGroups: Codable{               //NewsFeed- ServiceGroups

    var data: [Article]      //expected by myself ?

}

struct Article: Codable{
    
    let id: Int?
    let name: String?
    let description: String?
    let style: String?
    
    func SGtoString() -> String{
        return "id: \(id ?? 0)"/*, \(name ?? "-")" //id: \(id ?? 0)*/
    }

}
/*
let urlSG = URL(string: "https://business-beauty.staging.eservia.com/api/v1.0/widget/service-groups?code=35CDFF1D10A64E9E91D4EA9C8B983DBC")

 func fetchSG() async -> [Article] {
    guard let url = urlSG else {
        return []
    }
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let sg = try JSONDecoder().decode(serviceGroups.self, from: data).data
        
        return sg
    }
    catch {  print("Неожиданная ошибка: \(error).")
        return []
    }
}
*/
