//
//  SwitchViewController.swift
//  Slide Up Animation
//
//  Created by Adwait Barkale on 11/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit
import SkeletonView

class SwitchViewController: UIViewController,UITableViewDelegate,SkeletonTableViewDataSource {

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var data = [String]()
    
    var value = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblTitle.text = value
        view.backgroundColor = .green
        tableView.delegate = self
        tableView.dataSource = self
        
        //height for row at indexpath do not work when using skeleton view
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = 120
        
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .link), animation: nil, transition: .crossDissolve(0.25))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            
            for _ in 0...30
            {
                self.data.append("This is Just some Random Text to Show.")
            }
            
            self.tableView.stopSkeletonAnimation()
            self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
            self.tableView.reloadData()
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //tableView.showAnimatedSkeleton(usingColor: .concrete, transition: .crossDissolve(0.25))
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "SkeletonTableViewCell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SkeletonTableViewCell", for: indexPath) as! SkeletonTableViewCell
        
        if !data.isEmpty{
            cell.lblTitle.text = data[indexPath.row]
            cell.imgView.image = UIImage(systemName: "star")
        }
        return cell
    }

}
