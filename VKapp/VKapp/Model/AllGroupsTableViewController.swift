//
//  AllGroupsTableViewController.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
    var groups = [Group(groupName: "Наука", groupImage: "nauka.jpeg"),
                  Group(groupName: "Техника", groupImage: "1.jpeg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsTableViewCell", for: indexPath) as! AllGroupsTableViewCell
        cell.allGroupsName.text = groups[indexPath.row].groupName
        cell.allGroupsImage.image = UIImage(named: groups[indexPath.row].groupImage)
        return cell
    }
    
   
}
