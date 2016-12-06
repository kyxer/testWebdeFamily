//
//  ListController.swift
//  testWebdeFamily
//
//  Created by German Mendoza on 12/6/16.
//  Copyright © 2016 German Mendoza. All rights reserved.
//

import UIKit

class ListController: UITableViewController {
    
    var users:[User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "User List"
        let path = Utils.getUserDirectoryWithName("/users.json")
        guard let us = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? [User] else {
            return
        }
        self.users = us
        self.tableView.reloadData()
        
        setupNavbar()
    }

    func setupNavbar(){
        let logoutButton = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(tappedLogoutButton))
        
        navigationItem.rightBarButtonItems = [logoutButton]
    }
    
    func tappedLogoutButton(){
        dismiss(animated: true, completion: {
            if let controller = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                controller.popToRootViewController(animated: true)
            }
        })
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "test")
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
