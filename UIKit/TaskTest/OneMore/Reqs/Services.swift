//
//  Services.swift
//  OneMore
//
//  Created by Oleksandr Bodnar on 01.09.2022.
//

import Foundation

struct Services: Codable{               //NewsFeed- ServiceGroups

    var data: [Servicer]      //expected by myself ?

}

struct Servicer: Codable{
    
    var id: Int?
    var service_group_id: Int?
    let name: String?
    let price: Int?
    let currency: String?
    let is_fixed_price: Bool?
    let duration: Int?
    let status: Int?
    
    func toPrice() -> String{
        return "Від \(price ?? 0) \(currency ?? "-")"
    }
    
    func toDuration() -> String{
        return "🕒 \(duration ?? 0) (хв)"
    }
}

    final class SCCaller {
        static let shared = SCCaller()
        
        struct Constants {
            static let sсURL = URL(string:  "https://business-beauty.staging.eservia.com/api/v1.0/widget/services?code=35CDFF1D10A64E9E91D4EA9C8B983DBC")
        }
        
        private init() {}
        
        
        public func getServices (completion: @escaping (Result<[Servicer], Error>) -> Void) {
            guard let url = Constants.sсURL else {
                return
            }
            
            let task = URLSession.shared.dataTask (with: url) {data, response, error in
                if let error = error {
                    completion(.failure(error))
                }
                else if let data = data {
                    
                    do {
                        let result = try JSONDecoder().decode(Services.self, from: data)
                        
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
    
/*
}
let urlSS = URL(string: "https://business-beauty.staging.eservia.com/api/v1.0/widget/services?code=35CDFF1D10A64E9E91D4EA9C8B983DBC")

 func fetchSS() async -> [Servicer] {
    guard let url = urlSS else {
        return []
    }
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let ss = try JSONDecoder().decode(Services.self, from: data).data
        
        return ss
    }
    catch {  print("Неожиданная ошибка: \(error).")
        return []
    }*/


