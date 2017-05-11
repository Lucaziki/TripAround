//
//  LeftPageHeaderView.swift
//  PlayWayForDriver
//
//  Created by Lucaziki on 24/04/2017.
//  Copyright © 2017 Lucaziki. All rights reserved.
//

import UIKit
import Kingfisher

class LeftPageHeaderView: UIView {
    @IBOutlet weak var avatarView: UIImageView! {
        didSet {
            avatarView.layer.masksToBounds = true
            avatarView.layer.cornerRadius  = 35
        }
    }
    @IBOutlet weak var mobileLabel: UILabel!
    public var didTap: (() -> ())?
    
    override func awakeFromNib() {
        self.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(oneTap(_ :)))
        self.addGestureRecognizer(tapGR)
    }
    
    func oneTap(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == UIGestureRecognizerState.ended {
            if didTap != nil {
                didTap!()
            }
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
