//
//  ServerUrl.swift
//  PlayWayForDriver
//
//  Created by Lucaziki on 25/04/2017.
//  Copyright © 2017 Lucaziki. All rights reserved.
//

import UIKit

enum ServerUrl: String {
    case base      = "公司的项目重写练手，接口隐去了。"
    case login     = "/im/driver/admin/login.action"
    case checkCode = "/im/driver/admin/getCheckCode.action"
    case userInfo  = "/im/driver/user/getUserInfo.action"
    case uploadImg = "/im/driver/user/uploadHeadImgBase64.action"
}
