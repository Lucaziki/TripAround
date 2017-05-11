//
//  GeneralTools.swift
//  PlayWayForDriver
//
//  Created by Lucaziki on 26/04/2017.
//  Copyright © 2017 Lucaziki. All rights reserved.
//

import UIKit
import MBProgressHUD

class GeneralTools {
    init () {}
}

extension GeneralTools {
    open func addHUD(withTitle title: String?, details: String?, uponView view: UIView?) -> MBProgressHUD {
        let appDelegate = UIApplication.shared.delegate
        
        var hud = MBProgressHUD()
        
        if let view = view {
            hud = MBProgressHUD.showAdded(to: view, animated: true)
        } else {
            hud = MBProgressHUD.showAdded(to: ((appDelegate?.window)!)!, animated: true)
        }
        
        return hud
    }
}
