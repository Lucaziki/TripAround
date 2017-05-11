//
//  LeftPageCell.swift
//  PlayWayForDriver
//
//  Created by Lucaziki on 24/04/2017.
//  Copyright © 2017 Lucaziki. All rights reserved.
//

import UIKit

class LeftPageCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var workingSwitch: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.clear
        self.selectionStyle  = UITableViewCellSelectionStyle.none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillData(withDic dic: Dictionary<String, String>) {
        if let title = dic["title"] {
            self.titleLabel.text = title
            if title == "出车" {
                self.workingSwitch.isHidden = false
            } else {
                self.workingSwitch.isHidden = true
            }
        }
        if let imgName = dic["img"] {
            self.imgView.image = UIImage(named: imgName)
        }
        
        
        
    }
}
