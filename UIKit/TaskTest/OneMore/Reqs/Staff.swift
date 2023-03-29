//
//  Staff.swift
//  OneMore
//
//  Created by Oleksandr Bodnar on 01.09.2022.
//

import Foundation

// MARK: - ServiceGroups
//changed to staff

final class SFCaller {
    static let shared = SFCaller()
    
    struct Constants {
        static let sfURL = URL(string:  "https://business-beauty.staging.eservia.com/api/v1.0/widget/staffs?code=35CDFF1D10A64E9E91D4EA9C8B983DBC")
    }
    
    private init() {}
    
    
    public func getStaff (completion: @escaping (Result<[Staffer], Error>) -> Void) {
        guard let url = Constants.sfURL else {
            return
        }
        
        let task = URLSession.shared.dataTask (with: url) {data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let resultSF = try JSONDecoder().decode(Staff.self, from: data)
                    
                    print(resultSF)
                    completion(.success(resultSF.data))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

struct Staff: Codable{          //preResponse

    var data: [Staffer]
    
}

struct Staffer: Codable{            //[serviceGroups]
    
    let first_name: String?
    let last_name: String?
    let photo: String?
    let position: String?
    
    func names() -> String{
        return "\(first_name ?? "") \(last_name ?? "")"
    }
}

