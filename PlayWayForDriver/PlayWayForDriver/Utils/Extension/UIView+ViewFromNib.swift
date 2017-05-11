//
//  UIView+ViewFromNib.swift
//  PlayWayForDriver
//
//  Created by Lucaziki on 24/04/2017.
//  Copyright © 2017 Lucaziki. All rights reserved.
//

import Foundation

extension UIView {
    func viewFromNib<T: UIView>() -> T? {
        
        guard let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?[0] as? T  else {
            return nil
        }
        return view
    }
}
