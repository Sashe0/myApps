//
//  ProfileViewController.swift
//  OneMore
//
//  Created by Oleksandr Bodnar on 01.09.2022.
//

import UIKit
import SafariServices


class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(SFTableViewCell.self,
                       forCellReuseIdentifier: SFTableViewCell.identifier)
        return table
    }()

    private var articles = [Staffer]()
    private var viewModels = [SFTableViewCellModel]()
    
    override func viewDidLoad() {
        tabBarController?.tabBar.tintColor = UIColor.white
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        SFCaller.shared.getStaff { [weak self] resultSF in
            switch resultSF {
            case .success(let data):
                self?.articles = data
                self?.viewModels = data.compactMap({
                    SFTableViewCellModel(
                        first_name: $0.names(),
                        position: $0.position ?? "No description",
                        imageURL: URL(string: $0.photo ?? "")
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
    
    //Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SFTableViewCell.identifier, for: indexPath) as? SFTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let article = articles[indexPath.row]
        
        guard let url = URL(string: article.photo ?? "" ) else { return }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
