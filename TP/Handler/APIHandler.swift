//
//  APIHandler.swift
//  TP
//
//  Created by Infxit-08893 on 07/01/19.
//  Copyright © 2019 infinx. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct APIHandler {

typealias CallbackType = (_ success: Bool, _ json: JSON?, _ error: Error?, _ httpStatusCode: Int, _ errorMessage: String?) -> Void
private let baseurl = "http://swankitsolutions.co.in/client_quiz/client_quiz/index.php/"


struct APIMethods {
    static let GetAds = "ads_iwm"
}

    static let shared = APIHandler()

    func doAPIPostCallForMethod(urls : String, callback: @escaping CallbackType)
{
    let methodType = HTTPMethod.post
    let encoding = JSONEncoding.default
    let url : URL = URL(string: "\(baseurl)\(urls)")!
    Alamofire.request(url, method: methodType, parameters: nil, encoding: encoding, headers: nil).responseJSON { (response) in

        switch response.result
        {
        case .success:
            if let value = response.result.value {
                let json = JSON(value)
                callback(true, json, nil, response.response?.statusCode ?? 0, nil)
            }
        case .failure(let error):
            print("error\(error.localizedDescription)")
        }
    }
}
}
