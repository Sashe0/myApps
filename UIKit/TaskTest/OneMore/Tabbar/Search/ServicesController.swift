//
//  ServicesController.swift
//  OneMore
//
//  Created by Oleksandr Bodnar on 23.11.2022.
//

import Foundation
import UIKit

class ServicesController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var idSG = 0
    private var services = [Servicer]()
    private var viewModel = [SCTableViewCellModel]()
    private var groupCell = [SGTableViewCellModel]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(SCTableViewCell.self,
                       forCellReuseIdentifier: SCTableViewCell.identifier)
        return table
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.tintColor = UIColor.white
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        SCCaller.shared.getServices { [weak self] result in
            switch result {
            case .success(let dataSC):
                self?.services = dataSC
                self?.viewModel = dataSC.compactMap({
                    SCTableViewCellModel(
                        name: $0.name!,
                        service_group_id: $0.service_group_id!,
                        price: $0.toPrice(),
                        duration: $0.toDuration()
                        )
                       }).filter({ word in
                           return word.service_group_id == self?.idSG
                       })
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SCTableViewCell.identifier, for: indexPath) as? SCTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        print("\(indexPath.row)" )
        
        let vc = ProfileViewController().self
        navigationController?.pushViewController(vc, animated: true)
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

