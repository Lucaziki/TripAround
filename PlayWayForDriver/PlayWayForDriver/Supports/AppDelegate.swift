//
//  AppDelegate.swift
//  PlayWayForDriver
//
//  Created by Lucaziki on 24/04/2017.
//  Copyright © 2017 Lucaziki. All rights reserved.
//

import UIKit
import MMDrawerController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    fileprivate var drawerController: MMDrawerController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.setNavigationBar()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.white
        
        let mainVC = MainPageViewController()
        let mainNav = UINavigationController(rootViewController: mainVC)
        let leftVC = LeftPageViewController()
        self.drawerController = MMDrawerController(center: mainNav, leftDrawerViewController: leftVC)
        self.drawerController?.showsShadow = false
        self.drawerController?.setMaximumLeftDrawerWidth(UIScreen.main.bounds.size.width * 0.7, animated: true, completion: nil)
        self.drawerController?.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.all
        // FIXME: 请自行更换高德地图的apiKey后运行项目
        AMapServices.shared().apiKey = "输入你自己的apiKey"
        
        self.window!.rootViewController = self.drawerController!
        self.window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    fileprivate func setNavigationBar() {
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.white
        navBar.tintColor = UIColor.black
        navBar.isTranslucent = false
        navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black,
                                      NSFontAttributeName:UIFont(name: "Helvetica Light", size: 22.0) ?? UIFont.systemFont(ofSize: 22)]
    }

}

