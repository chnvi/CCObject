//
//  CCRequestUtil.swift
//  gogogo
//
//  Created by 陈伟 on 2017/3/28.
//  Copyright © 2017年 陈伟. All rights reserved.
//

import UIKit
import Alamofire
//import Alamofire

enum CCRequestType: String{
    case GET = "GET"
    case POST = "POST"
}

typealias CCRequestCallBack = (_ result: AnyObject)->()

class CCRequestUtil {
    
    static let  sharedTools = CCRequestUtil()
    
    
}

extension CCRequestUtil{
    
    func request(method: CCRequestType, url: NSString, parames: [String: AnyObject], timeout: TimeInterval, isValidate: Bool, finished: CCRequestCallBack) {
        
        switch method {
        case CCRequestType.GET:
//            detailViewController.segueIdentifier = "GET"
//            return Alamofire.request("https://httpbin.org/get")
//            alamo
//            Alamofire.request(<#T##url: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>)
            
            break
        case CCRequestType.POST:
            
            
            break
//            detailViewController.segueIdentifier = "POST"
//            return Alamofire.request("https://httpbin.org/post", method: .post)
//        case "PUT":
//            detailViewController.segueIdentifier = "PUT"
//            return Alamofire.request("https://httpbin.org/put", method: .put)
//        case "DELETE":
//            detailViewController.segueIdentifier = "DELETE"
//            return Alamofire.request("https://httpbin.org/delete", method: .delete)
//        case "DOWNLOAD":
//            detailViewController.segueIdentifier = "DOWNLOAD"
//            let destination = DownloadRequest.suggestedDownloadDestination(
//                for: .cachesDirectory,
//                in: .userDomainMask
//            )
//            return Alamofire.download("https://httpbin.org/stream/1", to: destination)
        default:
            break
//            return nil
        }

        
        
        
    }
    
}

