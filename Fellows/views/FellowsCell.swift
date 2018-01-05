//
//  FellowsCell.swift
//  Fellows
//
//  Created by C4Q on 1/5/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class FellowsCell: UITableViewCell {

    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red 
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "FellowCell")
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //get the frame of the UI elements here
        profileImageView.layer.cornerRadius = profileImageView.bounds.width/2.0
        profileImageView.layer.masksToBounds = true //keeps Image to bounds
    }
    
    
    private func setupViews() {
        setupProfileImage()
        setupNameLabel()
        
    }
    private func setupProfileImage() {
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor).isActive = true
    }
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func configureCell(fellow: Fellow) {
        nameLabel.text = fellow.name
        if let imageURL = fellow.imageURL {
            if let image = ImageCache.manager.cachedImage(url: imageURL) {
                profileImageView.image = image
            } else {
                ImageCache.manager.processImageInBackground(imageURL: imageURL, completion: {(error, image) in
                    if let error = error {
                        print(error.localizedDescription)
                        
                    } else if let image = image {
                        DispatchQueue.main.async {
                            self.profileImageView.image = image
                        }
                    }
                }
                )
            }
        } else {
            profileImageView.image = UIImage(named:"placeholder-image")
        }
    }
    

    

}
