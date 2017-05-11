//
//  MainPageViewController.swift
//  PlayWayForDriver
//
//  Created by Lucaziki on 24/04/2017.
//  Copyright © 2017 Lucaziki. All rights reserved.
//

import UIKit
import MMDrawerController

class MainPageViewController: BaseViewController, MAMapViewDelegate, AMapSearchDelegate {

    var mapView = MAMapView()
    var search  = AMapSearchAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(pushToPersonalCenterVC(_:)), name: Notification.Name(rawValue: "PushToPersonalCenterVC"), object: nil)
        self.buildUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UI布局
    fileprivate func buildUI() {
        self.title = "任性游"
        self.view.backgroundColor = UIColor.white
        
        // map
        AMapServices.shared().enableHTTPS = true
        self.view.addSubview(self.mapView)
        self.mapView.snp.makeConstraints({ (make) in
            make.top.left.right.bottom.equalTo(self.view).offset(0);
        })
        self.mapView.showsScale = false
        self.mapView.showsCompass = false
        self.mapView.showsUserLocation = true
        self.mapView.userTrackingMode = MAUserTrackingMode.follow
        self.mapView.centerCoordinate = CLLocationCoordinate2DMake(39.907728, 116.397968)
        self.mapView.setZoomLevel(16, animated: true)
        self.mapView.delegate = self
        
        self.search?.delegate = self
        
        // navigation bar
        let menuBtn = UIButton(type: UIButtonType.custom)
        menuBtn.frame = CGRect(x: 0, y: 4, width: 60, height: 34)
        menuBtn.setImage(UIImage(named: "LeftMenu"), for: UIControlState.normal)
        menuBtn.addTarget(self, action: #selector(MainPageViewController.showMenu(btn:)), for: UIControlEvents.touchDragInside)
        menuBtn.setTitle("          ", for: UIControlState.normal)
        let menuBtnItem = UIBarButtonItem(customView: menuBtn)
        self.navigationItem.setLeftBarButton(menuBtnItem, animated: false)
    }

    // MARK: 按钮点击事件
    func showMenu(btn: UIButton) {
        self.mm_drawerController.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    
    // MARK: Notification Methods
    func pushToPersonalCenterVC(_ notification: Notification) {
        self.mm_drawerController.toggle(MMDrawerSide.left, animated: true, completion: nil)
        let vc = PersonalCenterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: MAMapViewDelegate
    func mapView(_ mapView: MAMapView!, didUpdate userLocation: MAUserLocation!, updatingLocation: Bool) {
        self.mapView.setCenter(userLocation.location.coordinate, animated: true)
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
