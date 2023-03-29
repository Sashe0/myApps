//
//  RequestSC.swift
//  Stud
//
//  Created by Oleksandr Bodnar on 28.12.2022.
//

import Foundation

class Servs: ObservableObject {
    @Published var ser: [Servicer] = []

    func getServices(){
        let urlSC = URL(string: "https://business-beauty.staging.eservia.com/api/v1.0/widget/services?code=35CDFF1D10A64E9E91D4EA9C8B983DBC")

        URLSession.shared.dataTask(with: urlSC!) {(data, response, error ) in
            DispatchQueue.main.async{ [self] in
                do{
                    if let data = data {
                        let result = try JSONDecoder().decode(Services.self, from: data)
                        ser = result.data
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


struct Services: Codable{               //NewsFeed- ServiceGroups

    var data: [Servicer]      //expected by myself ?

}

struct Servicer: Identifiable, Codable{
    
    let id: Int
    var service_group_id: Int
    let name: String
    let price: Int
    let currency: String
    let is_fixed_price: Bool?
    let duration: Int
    let status: Int?
    
//    func toPrice() -> String{
//        return "Від \(price ?? 0) \(currency ?? "-")"
//    }
//    
//    func toDuration() -> String{
//        return "🕒 \(duration ?? 0) (хв)"
//    }
}
