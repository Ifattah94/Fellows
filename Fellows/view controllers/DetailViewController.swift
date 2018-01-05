//
//  DetailViewController.swift
//  Fellows
//
//  Created by C4Q on 1/5/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let detailView = DetailVew()
    
    private var fellow: Fellow!
    init(fellow: Fellow, image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        self.fellow = fellow
        detailView.configureDetailView(fellow: fellow, image: image)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(detailView)
        detailView.dismissView.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        detailView.dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)

    }
    
    @objc func dismissView() {
    dismiss(animated: true, completion: nil)
    }

  

}
