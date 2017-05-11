//
//  PersonalCenterViewController.swift
//  PlayWayForDriver
//
//  Created by Lucaziki on 25/04/2017.
//  Copyright © 2017 Lucaziki. All rights reserved.
//

import UIKit
import Alamofire

class PersonalCenterViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.buildUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UI布局
    fileprivate func buildUI() {
        NetWorkManager.shared.getCheckCode(withPhoneNumber: "18501033497", success: { (json) in
            print(json)
            let status = json["status"] as! Int
            let data = json["data"] as! [String: Any]
            let checkNum = String(describing: data)
            if status == 200 {
                let action = UIAlertAction(title: "Yes", style: UIAlertActionStyle.cancel, handler: nil)
                let controller = UIAlertController(title: json["msg"] as? String, message: checkNum, preferredStyle: UIAlertControllerStyle.alert)
                controller.addAction(action)
                self.present(controller, animated: true, completion: nil)
                
            } else {
                
            }
            
        }) { (err) in
            print(err)
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
