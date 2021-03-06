//
//  NKNetworkDepartCode.swift
//  NKU Helper
//
//  Created by 陈乐天 on 2/29/16.
//  Copyright © 2016 陈乐天. All rights reserved.
//

import Foundation
import Alamofire

/// 提供获取DepartCode的网络库，未完成！
class NKNetworkDepartCode: NKNetworkBase {
    
    func searchDepartCode(departCode: String) {
        let url = "http://115.28.141.95:25000/departCode/" + NSString(string: departCode).stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())!
        Alamofire.request(.GET, url).responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            guard (response.result.value as? NSDictionary) != nil else {
    
                return
            }
            
        }
    }
    
}