//
//  NetWorkManager.swift
//  PlayWayForDriver
//
//  Created by Lucaziki on 25/04/2017.
//  Copyright © 2017 Lucaziki. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

public typealias Success = (_ response : [String : Any])->()
public typealias Failure = (_ error : Error)->()

class NetWorkManager {
    static let shared = NetWorkManager.init()
    private init() {}
}

extension NetWorkManager {
    // MARK: 网络请求的基础方法
    @discardableResult
    fileprivate func request(withMethod method: HTTPMethod, urlString subURLString: String, parameter: Parameters? = nil, success: @escaping Success, failure: @escaping Failure, isHUDViewShow:Bool) -> DataRequest {
        
        
        let appDelegate = UIApplication.shared.delegate!
        var hud = MBProgressHUD(view: appDelegate.window!!)
        
        if isHUDViewShow {
            hud = GeneralTools().addHUD(withTitle: nil, details: nil, uponView: appDelegate.window!)
        }
        
        let urlString = ServerUrl.base.rawValue.appending(subURLString)
        
        
        let manager = SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 20
        
        
        let dataRequest = manager.request(urlString, method: method, parameters: parameter, headers: ["Accept": "application/json"]).responseJSON { (response) in
            hud.hide(animated: true)
            switch response.result {
            case .success:
                success(response.result.value as! [String : Any])
            case .failure(let error):
                failure(error)
            }
        }
        return dataRequest
    }
    
    public func login(withUserName userName: String, checkCode: String, success: @escaping Success, failure: @escaping Failure) {
        let parameters = ["phone": userName, "checkNum": checkCode, "mobileType": "IOS"]
        self.request(withMethod: .post, urlString: ServerUrl.login.rawValue, parameter: parameters,success: success, failure: failure, isHUDViewShow: true)
    }
    
    public func getCheckCode(withPhoneNumber phone: String, success: @escaping Success, failure: @escaping Failure) {
        let parameters = ["phone": phone]
        self.request(withMethod: .post, urlString: ServerUrl.checkCode.rawValue, parameter: parameters, success: success, failure: failure, isHUDViewShow: true)
    }
    
    
}





