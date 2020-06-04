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
    
    var groups = [Group]()
    var filteredGroups = [Group]()
    var searching = false
    let apiWapper = ApiWrapper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
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
        
        let group = filteredGroups[indexPath.row]
        cell.allGroupsName.text = group.groupName
        cell.membersLabel.text = String(group.membersCount)
        let url = URL(string: group.image)
        cell.allGroupsImage.image = UIImage(data: try! Data(contentsOf: url!))!
        
        return cell
    }
    
   
}

extension AllGroupsTableViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredGroups = groups
        } else {
        apiWapper.groupSearch(searchText: searchText) { [weak self] filteredGroups in
            self?.filteredGroups = filteredGroups
            self?.tableView.reloadData()
        }
        searching = true
        }
        tableView.reloadData()
    }
}
