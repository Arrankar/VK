//
//  GroupsTableViewController.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit
import RealmSwift

class GroupsTableViewController: UITableViewController {
    
    let apiWapper = ApiWrapper()
    var groups: Results<Group>!
    var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiWapper.getGroups()
        pairTableAndRealm()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsTableViewCell", for: indexPath) as! GroupsTableViewCell
        let group = groups[indexPath.row]
        cell.configure(with: group)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}

extension GroupsTableViewController {
    
    func pairTableAndRealm() {
        let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        guard let realm = try? Realm(configuration: config) else { return }
        groups = realm.objects(Group.self)
        token = groups.observe { [weak self] changes in
            guard let tableView = self?.tableView else { return }
            switch changes {
            case .initial:
                tableView.reloadData()
            case let .update(_,  deletions, insertions, modifications):
                tableView.beginUpdates()
                tableView.insertRows(at: insertions.map(    { IndexPath(row: $0, section: 0)}), with: .none)
                tableView.deleteRows(at: deletions.map(     { IndexPath(row: $0, section: 0)}), with: .none)
                tableView.reloadRows(at: modifications.map( { IndexPath(row: $0, section: 0)}), with: .none)
                tableView.endUpdates()
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }
}
