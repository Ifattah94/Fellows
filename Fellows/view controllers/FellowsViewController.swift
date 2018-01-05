//
//  FellowsViewController.swift
//  Fellows
//
//  Created by C4Q on 1/5/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import GameplayKit

class FellowsViewController: UIViewController {

    let fellowView = FellowView()
    
    var fellows = [Fellow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(fellowView)
        fellowView.tableView.dataSource = self
        fellowView.tableView.delegate = self
        navigationItem.title = "Fellows"
        
        if let results = JSONParsingService.parseJSONFile(filename: "Fellows", type: "JSON") {
            fellows = results.sorted{$0.name < $1.name}
            
        }
        configureNavBar()

    }
    
    
    private func configureNavBar() {
        navigationItem.title = "Fellows"
        let shuffleBarItem = UIBarButtonItem(title: "Shuffle", style: .plain, target: self, action: #selector(shuffleFellows))
        navigationItem.rightBarButtonItem = shuffleBarItem
    
}
    @objc func shuffleFellows() {
        fellows = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: fellows) as! [Fellow]
        fellowView.tableView.reloadData()
    }
    
}
extension FellowsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fellows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FellowCell", for: indexPath) as! FellowsCell
        let fellow = fellows[indexPath.row]
        cell.configureCell(fellow: fellow)
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //push detail view to our hierarchy
        let fellow = fellows[indexPath.row]
        var cellImage: UIImage!
        if let cell = tableView.cellForRow(at: indexPath) as? FellowsCell {
            
            
            if let image = cell.profileImageView.image {
                cellImage = image
            } else {
                cellImage = UIImage(named:"placeholder-image")
            }
            
            let detailViewController = DetailViewController(fellow: fellow, image: cellImage)
            
            detailViewController.modalTransitionStyle = .crossDissolve
        detailViewController.modalPresentationStyle = .overCurrentContext
        present(detailViewController, animated: true, completion: nil)
        
    }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    
    
    
}
