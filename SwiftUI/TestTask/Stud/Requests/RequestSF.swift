//
//  RequestSS.swift
//  Stud
//
//  Created by Oleksandr Bodnar on 29.12.2022.
//

import Foundation

class Staffs: ObservableObject {
    @Published var star: [Staffer] = []

    func getStaffs(){
        let urlSS = URL(string: "https://business-beauty.staging.eservia.com/api/v1.0/widget/staffs?code=35CDFF1D10A64E9E91D4EA9C8B983DBC")

        URLSession.shared.dataTask(with: urlSS!) {(data, response, error ) in
            DispatchQueue.main.async{ [self] in
                do{
                    if let data = data {
                        let result = try JSONDecoder().decode(Staff.self, from: data)
                        star = result.data
                    } else{
                        print("No data")
                    }
                }catch (let error){
                    print("Some error: \(error)")
                    }
            }
        }.resume()
    }
}

struct Staff: Codable{          //preResponse

    var data: [Staffer]
    
}

struct Staffer: Identifiable, Codable{
    
    let id: Int?
    let first_name: String?
    let last_name: String?
    let photo: String?
    let position: String?
    
//    func names() -> String{
//        return "\(first_name ?? "") \(last_name ?? "")"
//    }
}
