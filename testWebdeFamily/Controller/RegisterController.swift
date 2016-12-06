//
//  RegisterController.swift
//  testWebdeFamily
//
//  Created by German Mendoza on 12/6/16.
//  Copyright © 2016 German Mendoza. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedRegisterButton(_ sender: Any) {
        
        guard let name = nameTextField.text,
        let email = emailTextField.text,
        let password = passwordTextField.text else { return }
        
        
        if name == "" {
            Utils.showAlert(controller: self, message: "Name has wrong format")
            return
        }
        
        if email == "" {
            Utils.showAlert(controller: self, message: "Email has wrong format")
            return
        }
        
        if password == "" {
            Utils.showAlert(controller: self, message: "Password has wrong format")
            return
        }
        
        let user = User(name: name, email: email, password: password)
        
        let path = Utils.getUserDirectoryWithName("/users.json")
        var users:[User] = []
        if let archive = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? [User] {
            users = archive
        }
        users.append(user)
        NSKeyedArchiver.archiveRootObject(users, toFile: path)
        
        Utils.showAlert(controller: self, message: "You have been register!", acceptHandler: { completed in
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "List")
            let navigationController = UINavigationController(rootViewController: controller)
            self.show(navigationController, sender: nil)
            
            self.nameTextField.text = ""
            self.emailTextField.text = ""
            self.passwordTextField.text = ""
        
        })
        
    }
}
