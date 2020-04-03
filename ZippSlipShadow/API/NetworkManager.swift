//
//  NetworkManager.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 31/03/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class NetworkManager: NSObject {
    
    let apiConstant = Constant()
    
    func getHeaders() -> HTTPHeaders {
    let headers:HTTPHeaders = [
        "Content-Type": "application/json",
        "x-mobile":"true",
        "appVersion":"2"
    ]
        return headers
    }
       
    func doLogin(userName:String,password:String,_ completion: @escaping ServiceResponse) -> Void {
    //Login Parameters
    let parms=["username":userName,
               "password":password,
               "deviceToken":"qwertykjhgffgdh213445",
               "userAgent":2,
               "districtId":"0"
        ] as [String : Any]
        
        AF.request(apiConstant.BASEURL+apiConstant.AuthenticateUser, method:.post, parameters: parms, encoding:JSONEncoding.default, headers: getHeaders()).responseJSON { response in
            switch response.result {
                case .success:
                    do {
                        let dictionary = response.value as? [String: Any]
                        let statusCode:Int=dictionary?["statusCode"] as! Int
                        if statusCode == 200{
                            let jsonData  = try JSON.init(data: response.data!)
                            completion(jsonData  , nil)
                        }else{
                            completion( "nil"  ,  "")
                        }
                    } catch _ {
                        _ = "nil"
                    }

            case .failure(let _):
                               completion( "nil"  ,  "")
        }

//            print("dictionary = \(dictionary)" as Any)
//            let userArray = dictionary?["Users"] as! [[String:Any]]
//            var users = [Users]()
//            for user in userArray{
//                var user1 = Users()
//                user1.Id = user["Id"] as! String
//                users.append(user1)
//            }
            
        }
    
    }
    }

