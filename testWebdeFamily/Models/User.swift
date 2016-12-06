//
//  Product.swift
//  testWebdeFamily
//
//  Created by German Mendoza on 12/6/16.
//  Copyright © 2016 German Mendoza. All rights reserved.
//

import UIKit

class User: NSObject, NSCoding {
    
    var name:String?
    var email:String?
    var password:String?

    init(name:String, email:String, password:String){
        
        self.name = name
        self.email = email
        self.password = password
    }
    
    required convenience init?(coder decoder:NSCoder) {
        guard let name = decoder.decodeObject(forKey: "name") as? String,
            let email = decoder.decodeObject(forKey: "email") as? String,
            let password = decoder.decodeObject(forKey: "password") as? String
            else { return nil }
    
        self.init(
            name: name,
            email: email,
            password: password
        )
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.email, forKey: "email")
        aCoder.encode(self.password, forKey: "password")
    }
}
