//
//  SecondViewController.swift
//  OneMore
//
//  Created by Oleksandr Bodnar on 03.12.2022.
//

import UIKit
import SafariServices


class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(BBTableViewCell.self,
                       forCellReuseIdentifier: BBTableViewCell.identifier)
        return table
    }()
    
    var idSG = ""
//    var idSG = URL(string: idSG)

    private var articles = [Staffer]()
    private var viewModels = [BBTableViewCellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second"                   //also to name button
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        SFCaller.shared.getStaff { [weak self] resultSF in
            switch resultSF {
            case .success(let data):
                self?.articles = data
                self?.viewModels = data.compactMap({
                    BBTableViewCellModel(
                        first_name: $0.first_name!,
                        position: $0.position ?? "No description",
                        imageURL: URL(string: $0.photo ?? "")
                    )
                }).filter({ word in
                    return word.imageURL == URL(string: self!.idSG ?? "-")})
                
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BBTableViewCell.identifier, for: indexPath) as? BBTableViewCell else {
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

