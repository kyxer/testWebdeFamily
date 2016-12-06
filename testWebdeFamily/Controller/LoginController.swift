//
//  LoginController.swift
//  testWebdeFamily
//
//  Created by German Mendoza on 12/6/16.
//  Copyright © 2016 German Mendoza. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var users:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let path = Utils.getUserDirectoryWithName("/users.json")
        if let archive = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? [User] {
            users = archive
        }

    }

    @IBAction func tappedLoginButton(_ sender: Any) {
        
        guard let email = emailTextField.text,
            let password = passwordTextField.text else { return }
        
        if email == "" {
            Utils.showAlert(controller: self, message: "Email has wrong format")
            return
        }
        
        if password == "" {
            Utils.showAlert(controller: self, message: "Password has wrong format")
            return
        }
        
        if searchUserBy(email: email, password: password) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "List")
            let navigationController = UINavigationController(rootViewController: controller)
            show(navigationController, sender: nil)
            emailTextField.text = ""
            passwordTextField.text = ""
            return
            
        } else {
            Utils.showAlert(controller: self, message: "Sorry! Bad Credentials")
        }
        
    }
    
    
    @IBAction func tappedRegisterButoon(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Register")
        navigationController?.show(controller, sender: nil)
        
    }
    
    func searchUserBy(email:String, password:String) ->Bool{
        
        for user in users {
            if user.email! == email && user.password! == password {
                return true
            }
        }
        
        return false
    }
}
