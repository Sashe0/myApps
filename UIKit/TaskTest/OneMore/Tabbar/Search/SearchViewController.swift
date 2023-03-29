//
//  SearchViewController.swift
//  OneMore
//
//  Created by Oleksandr Bodnar on 01.09.2022.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private var services = [Servicer]()
    private var viewModel = [SCTableViewCellModel]()
    
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
            case .success(let data):
                self?.services = data
                self?.viewModel = data.compactMap({
                    SCTableViewCellModel(
                        name: $0.name!,
                        service_group_id: $0.service_group_id!,
                        price: $0.toPrice(),
                        duration: $0.toDuration()
                        /*imageURL: URL(string: $0.photo ?? "")*/
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SCTableViewCell.identifier, for: indexPath) as? SCTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("\(indexPath.row)" )
        /*let article = article[indexPath.row]
        
        guard let url = URL(string: article.photo ?? "" ) else { return }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)*/
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
