//
//  AllGroupsTableViewController.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var groups = [Groups]()
    
    var filteredGroups = [Groups]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchBar.delegate = self
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
        return filteredGroups.count
        }
        return groups.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsTableViewCell", for: indexPath) as! AllGroupsTableViewCell
        var group: Groups
        
        if searching {
            group = filteredGroups[indexPath.row]
        } else {
            group = groups[indexPath.row]
        }
        
//        cell.allGroupsName.text = group.groupName
//        cell.allGroupsImage.image = UIImage(named: group.groupImage)
        return cell
    }
    
   
}

//extension AllGroupsTableViewController: UISearchBarDelegate {
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText.isEmpty {
//            filteredGroups = groups
//        } else {
//        filteredGroups = groups.filter({ (group: Groups) -> Bool in
//            return group.groupName.lowercased().contains(searchText.lowercased())
//        })
//        searching = true
//        }
//        tableView.reloadData()
//    }
//}
