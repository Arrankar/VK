//
//  AllGroupsTableViewController.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AllGroupsTableViewController: UITableViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var groups = [Group]()
    let apiWapper = ApiWrapper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsTableViewCell", for: indexPath) as! AllGroupsTableViewCell
        
        let group = groups[indexPath.row]
        cell.allGroupsName.text = group.groupName
        cell.membersLabel.text = String(group.membersCount)
        let url = URL(string: group.image)
        cell.allGroupsImage.image = UIImage(data: try! Data(contentsOf: url!))!
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let group = groups[indexPath.row]
        if group.isMember != 1 {
            let alertVC = UIAlertController(title: "Вступить в данное сообщество?", message: nil, preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in
                self.apiWapper.addGroup(groupId: group.id)
                Database.database().reference(withPath: "Authenticated users").child(String(Session.instance.userId)).child(String(group.id)).setValue(group.toAnyObject())
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alertVC.addAction(confirmAction)
            alertVC.addAction(cancelAction)
            present(alertVC, animated: true, completion: nil)
        } else {
            let alertVC = UIAlertController(title: "Вы уже являетесь участником данного сообщества", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
            alertVC.addAction(cancelAction)
            present(alertVC, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}

extension AllGroupsTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            groups = [Group]()
            tableView.reloadData()
        } else {
            apiWapper.groupSearch(searchText: searchText) { [weak self] filteredGroups in
                self?.groups = filteredGroups
                self?.tableView.reloadData()
            }
        }
        tableView.reloadData()
    }
}
