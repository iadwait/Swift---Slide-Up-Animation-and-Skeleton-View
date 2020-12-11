//
//  menuViewCell.swift
//  Slide Up Animation
//
//  Created by Adwait Barkale on 11/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class menuViewCell: UITableViewCell {
    
    //without lazy issue in frame unresolved
    lazy var backView: UIView = {
        let bv = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        return bv
    }()
    
    let imgView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 15, y: 10, width: 30, height: 30))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var lblTitle: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 60, y: 10, width: self.frame.width - 80, height: 30))
        
        return lbl
    }()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.addSubview(backView)
        backView.addSubview(imgView)
        backView.addSubview(lblTitle)
        
    }

}
