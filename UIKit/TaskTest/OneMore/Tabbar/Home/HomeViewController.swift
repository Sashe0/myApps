//
//  HomeViewController.swift
//  OneMore
//
//  Created by Oleksandr Bodnar on 01.09.2022.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    private var article = [Article]()
    private var viewModel = [SGTableViewCellModel]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(SGTableViewCell.self,
                       forCellReuseIdentifier: SGTableViewCell.identifier)
        return table
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.tintColor = UIColor.white
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        SGCaller.shared.getGropus { [weak self] result in
            switch result {
            case .success(let data):
                self?.article = data
                self?.viewModel = data.compactMap({
                    SGTableViewCellModel(
                        name: $0.name!,
                        id: $0.id!
                    )
                    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SGTableViewCell.identifier, for: indexPath) as? SGTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModel[indexPath.row])
        return cell
    }
    
    //Important
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let passer = article[indexPath.row]
        
        let vc = ServicesController().self
        vc.idSG = passer.id ?? 0
        navigationController?.pushViewController(vc, animated: true)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

