//
//  Utils.swift
//  testWebdeFamily
//
//  Created by German Mendoza on 12/6/16.
//  Copyright © 2016 German Mendoza. All rights reserved.
//

import UIKit

class Utils {

    static func getUserDirectoryWithName(_ nameFile:String)->String {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let path = documents + nameFile
        return path
    }
    
    static func showAlert(controller:UIViewController, message:String, acceptHandler:((_ action:UIAlertAction)->())? = nil){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        if let unwrappedAccept = acceptHandler {
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: unwrappedAccept))
        } else {
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }
        
        controller.present(alert, animated: true, completion: nil)
    }
}
