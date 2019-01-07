//
//  Home.swift
//  TP
//
//  Created by Infxit-08893 on 07/01/19.
//  Copyright © 2019 infinx. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Home_Model : JSONDeserializable
{

    var success = ""

    var get_array = [Any]()

    static func deserialize(_ element: JSON) -> Home_Model {
        var home = Home_Model()
        print(element)
        if let success = element["is_success"].string {
            home.success = success
        }

        if let urlss = element["url"].array {
            home.get_array = urlss
        }
        return home
    }






}
