//
//  DetailVew.swift
//  Fellows
//
//  Created by C4Q on 1/5/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class DetailVew: UIView {

    
    
    lazy var dismissView: UIButton = {
        let button = UIButton(frame: UIScreen.main.bounds)
        button.backgroundColor = .clear
        return button
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dismissButtonIcon"), for: .normal)
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var bioTextView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = UIColor.init(red: 0.96, green: 0.45, blue: 0.5, alpha: 1)
        tv.isEditable = false
        tv.isSelectable = false
        tv.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
//    convenience init (fellow: Fellow, image: UIImage) {
//         self.init(frame: UIScreen.main.bounds)
//        //TODO setup image view and text views/labels
//    }
    
    
    private func commonInit() {
        backgroundColor = .clear
        
        setupViews()
    }
    
    override func layoutSubviews() {
        //get the size of the elements
        super.layoutSubviews()
        profileImage.layer.cornerRadius = profileImage.bounds.width/2.0
        profileImage.layer.masksToBounds = true
        bioTextView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    
    private func setupViews() {
        setupBlurEffectView()
        setupDismissView()
        setupContainterView()
        setUpDismissButton()
        setupNameLabel()
        setupProfileImage()
        setupBioTextView()
    }
    private func setupBlurEffectView() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark) // .light, .dark, .prominent, .regular, .extraLight
        let visualEffect = UIVisualEffectView(frame: UIScreen.main.bounds) //our visual effect will consist of the entire screen
        visualEffect.effect = blurEffect //give the visual effect our blur effect
        addSubview(visualEffect)
    }
    
    private func setupContainterView() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true
        
    }
    private func setUpDismissButton() {
        addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: dismissButton.bottomAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    
    
    private func setupDismissView() {
        addSubview(dismissView)
    }
    
    public func configureDetailView(fellow: Fellow, image: UIImage) {
        nameLabel.text = fellow.name
        profileImage.image = image
        bioTextView.text = fellow.bio ?? "no bio"
    }
    private func setupProfileImage() {
        addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16).isActive = true
        profileImage.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.50).isActive = true
        
        profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor).isActive = true 
    }
    func setupBioTextView() {
        addSubview(bioTextView)
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        bioTextView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16).isActive = true
        bioTextView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        bioTextView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
        bioTextView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
    }

}
