//
//  GroupsTableViewController.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    var groups = [Group]()
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsTableViewCell", for: indexPath) as! GroupsTableViewCell
        
        cell.groupName.text = groups[indexPath.row].groupName
        cell.groupImage.image = UIImage(named: groups[indexPath.row].groupImage)
        return cell
    }
    
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        
        if segue.identifier == "addGroup" {
        
            guard let allGroupsTableViewController = segue.source as? AllGroupsTableViewController  else { return }
            
            if let indexPath = allGroupsTableViewController.tableView.indexPathForSelectedRow {
                
                var group: Group
                
                if allGroupsTableViewController.searching {
                    group = allGroupsTableViewController.filteredGroups[indexPath.row]
                   
                } else {
                    group = allGroupsTableViewController.groups[indexPath.row]
                }
             
                if !groups.contains(group) {
                    groups.append(group)
                    
                    tableView.reloadData()
                }
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
