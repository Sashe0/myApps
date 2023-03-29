//
//  SCViewCell.swift
//  OneMore
//
//  Created by Oleksandr Bodnar on 23.11.2022.
//

import UIKit

class SCTableViewCellModel {
    let name: String
    let price: String
    let duration: String
    let service_group_id: Int

    
    init(name: String, service_group_id: Int, price: String, duration: String /*, imageURL: URL?*/) {
        self.name = name
        self.service_group_id = service_group_id
        self.price = price
        self.duration = duration
    }
}

class SCTableViewCell: UITableViewCell {
    static let identifier = "SCTableViewCell"
    
    private let namesTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 5
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 5
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .light)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(namesTitleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(durationLabel)
    }
       
    
    required init?(coder: NSCoder) {
        fatalError()
    }
  
    override func layoutSubviews() {
        super.layoutSubviews()
    
        
        namesTitleLabel.frame = CGRect(
            x: 10,
            y: 0,
            width: contentView.frame.size.width - 170,
            height: 70
        )
        
        priceLabel.frame = CGRect(
            x: contentView.frame.width - 120,
            y: 50,
            width: contentView.frame.size.width - 80,
            height: contentView.frame.size.height/2
        )
        
        durationLabel.frame = CGRect(
            x: 10,
            y: 50,
            width: contentView.frame.size.width - 80,
            height: contentView.frame.size.height/2
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        namesTitleLabel.text = nil
        priceLabel.text = nil
        durationLabel.text = nil

    }

    func configure(with viewModel: SCTableViewCellModel){
        namesTitleLabel.text = viewModel.name
        subtitleLabel.tag = viewModel.service_group_id
        priceLabel.text = viewModel.price
        durationLabel.text = viewModel.duration
    }
}
