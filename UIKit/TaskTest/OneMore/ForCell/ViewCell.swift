//
//  ViewCell.swift
//  OneMore
//
//  Created by Oleksandr Bodnar on 06.09.2022.
//

import UIKit

class SFTableViewCellModel {
    let first_name: String
    let position: String
    let imageURL: URL?
    var imageData: Data? = nil
    
    init(first_name: String, position: String, imageURL: URL?) {
        self.first_name = first_name
        self.position = position
        self.imageURL = imageURL
    }
}

class SFTableViewCell: UITableViewCell {
    static let identifier = "SFTableViewCell"
    
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 5
        return label
    }()
    
    private let newsImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .secondarySystemBackground
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(newsTitleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(newsImageView)
    }
       
    
    required init?(coder: NSCoder) {
        fatalError()
    }
  
    override func layoutSubviews() {
        super.layoutSubviews()
    
        
        newsTitleLabel.frame = CGRect(
            x: 10,
            y: 0,
            width: contentView.frame.size.width - 170,
            height: 70
        )
        
        subtitleLabel.frame = CGRect(
            x: 10,
            y: 50,
            width: contentView.frame.size.width - 80,
            height: contentView.frame.size.height/2
        )
        newsImageView.frame = CGRect(x: contentView.frame.size.width - 150, y: 5,
                                      width: 140,
                                      height: contentView.frame.size.height - 10)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImageView.image = nil
        newsTitleLabel.text = nil
        subtitleLabel.text = nil

    }

    func configure(with viewModel: SFTableViewCellModel){
        newsTitleLabel.text = viewModel.first_name
        subtitleLabel.text = viewModel.position
        if let data = viewModel.imageData {
        newsImageView.image = UIImage(data: data)
        }
        else  if let url = viewModel.imageURL{
            //fetch image
            URLSession.shared.dataTask(with: url) { [weak self](data, _, error) in
                guard let data = data, error == nil else{
                    return
                }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self?.newsImageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
}

