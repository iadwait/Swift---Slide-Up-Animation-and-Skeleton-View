//
//  ViewController.swift
//  Slide Up Animation
//
//  Created by Adwait Barkale on 11/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let transparentView = UIView()
    let tableView = UITableView()
    
    let tableViewHeight:CGFloat = 250 //5 rows 50 each
    
    let tableData = [
    "Profile",
    "Favorite",
    "Notification",
    "Change Password",
    "Logout"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.isScrollEnabled = true
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(menuViewCell.self, forCellReuseIdentifier: "menuViewCell")
    }
    
    @IBAction func btnTestClicked(_ sender: UIButton) {
        print("Tapped")
    }
    
    
    @IBAction func btnMenuShowTapped(_ sender: UIBarButtonItem) {
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        transparentView.frame = self.view.frame
        view.addSubview(transparentView)
        
        let screenSize = UIScreen.main.bounds.size
        tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: tableViewHeight)
        view.addSubview(tableView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideTransparentView))
        transparentView.addGestureRecognizer(tapGesture)
        
        transparentView.alpha = 0
        
        var bottomSafeArea:CGFloat = 0
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows[0]
            //let topPadding = window.safeAreaInsets.top
            let bottomPadding = window.safeAreaInsets.bottom
            bottomSafeArea = bottomPadding
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            
            self.transparentView.alpha = 0.5
            //Bring Table view up
            self.tableView.frame = CGRect(x: 0, y: screenSize.height - self.tableViewHeight - bottomSafeArea, width: screenSize.width, height: self.tableViewHeight)
        }, completion: nil)
        
    }
    
    
    @objc func hideTransparentView()
    {
        hideTransparentView1()
    }
    
    func hideTransparentView1()
    {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            let screenSize = UIScreen.main.bounds.size
            self.transparentView.alpha = 0
            self.tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.tableViewHeight)
            
        }, completion: nil)
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuViewCell", for: indexPath) as! menuViewCell
        
        cell.imgView.image = UIImage(named: tableData[indexPath.row])
        cell.lblTitle.text = tableData[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row at - \(indexPath.row) Tapped")
        
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "SwitchViewController") as! SwitchViewController
        
        switch indexPath.row
        {
        case 0:
            nextVC.value = "Profile"
        case 1:
            nextVC.value = "Favorite"
        case 2:
            nextVC.value = "Notification"
        case 3:
            nextVC.value = "Change Password"
        case 4:
            nextVC.value = "Logout"
        default:
            break
        }
        navigationController?.pushViewController(nextVC, animated: true)
        self.hideTransparentView1()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

