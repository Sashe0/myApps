//
//  Request.swift
//  Stud
//
//  Created by Oleksandr Bodnar on 16.12.2022.
//

import Foundation


class Grand: ObservableObject {
    @Published var groups: [Groups] = []

    func getGroups(){
        let urlSG = URL(string: "https://business-beauty.staging.eservia.com/api/v1.0/widget/service-groups?code=35CDFF1D10A64E9E91D4EA9C8B983DBC")

        URLSession.shared.dataTask(with: urlSG!) {(data, response, error ) in
            DispatchQueue.main.async{ [self] in
                do{
                    if let data = data {
                        let result = try JSONDecoder().decode(serviceGroups.self, from: data)
                        groups = result.data
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
