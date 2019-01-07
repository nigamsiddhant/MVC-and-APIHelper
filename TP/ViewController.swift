//
//  ViewController.swift
//  TP
//
//  Created by Infxit-08893 on 07/01/19.
//  Copyright © 2019 infinx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        call_ads_api()
        
    }


    func call_ads_api()
    {
        let url = APIHandler.APIMethods.GetAds

        APIHandler.shared.doAPIPostCallForMethod(urls: url){ [weak self] (success, jsonData, errorData, statusCode, _) in
            print(success)
            print(jsonData)
            print(errorData)
            print(statusCode)
            guard let weakSelf = self else { return }
            guard success == true else {
                print("success1")
                return

            }
            if let suceessJson = jsonData?.dictionary, suceessJson != nil  {
                print("suceessJson)")
            } else {
               print("error1")
                return
            }


            guard let json = jsonData else { return }
            let homedetails: Home_Model = json.value()
            print(homedetails.success)
            print(homedetails.get_array)

        }


    }

}

