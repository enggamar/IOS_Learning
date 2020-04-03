//
//  BaseResonse.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 31/03/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import Foundation

class BaseResponse {
    var errorMessage:String = ""
    var status: String = ""
    var statusCode: Int = -1
    var authToken:String = ""
}
