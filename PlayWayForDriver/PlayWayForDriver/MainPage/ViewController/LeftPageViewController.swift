//
//  LeftPageViewController.swift
//  PlayWayForDriver
//
//  Created by Lucaziki on 24/04/2017.
//  Copyright © 2017 Lucaziki. All rights reserved.
//

import UIKit
import SnapKit

let LeftPageCellID = "LeftPageCellID"

class LeftPageViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    let dataSource = [["title":"出车","img":"组-55"],
    ["title":"车辆信息","img":"车辆信息"],
    ["title":"我的账户","img":"银行卡"],
    ["title":"订单管理","img":"订单管理"],
    ["title":"设置","img":"设置"],
    ["title":"反馈","img":"留言反馈"],
    ["title":"关于我们","img":"关于我们(1)"]]
    
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
        
        self.view.backgroundColor = UIColor.white
        
        self.tableView = UITableView(frame: CGRect(), style: UITableViewStyle.plain)
        self.view.addSubview(self.tableView!)
        self.tableView?.snp.makeConstraints({ (make) in
            make.top.left.right.bottom.equalTo(self.view).offset(0)
        })
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView?.rowHeight = 50
        self.tableView?.backgroundView = UIImageView(image: UIImage(named: "背景"))
        
        
        let headerContent = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 180))
        self.tableView?.tableHeaderView = headerContent
        let headerView = LeftPageHeaderView().viewFromNib() as! LeftPageHeaderView
        headerContent.addSubview(headerView)
        headerView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(headerContent).offset(0);
        }
        
        headerView.didTap = {() -> () in
            NotificationCenter.default.post(name: Notification.Name(rawValue: "PushToPersonalCenterVC"), object: nil)
        }
        
        self.tableView?.tableFooterView = UIView()
        
        
        
        let cellNib = UINib(nibName: String(describing: LeftPageCell.self), bundle: Bundle.main)
        self.tableView?.register(cellNib, forCellReuseIdentifier: LeftPageCellID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeftPageCellID) as! LeftPageCell
        cell.fillData(withDic: self.dataSource[indexPath.row])
        return cell
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
