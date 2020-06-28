//
//  ReloadGroupsTable.swift
//  VKapp
//
//  Created by Александр on 28.06.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation
import RealmSwift

class ReloadGroupsTable: Operation {
    
    var outputGroupData: Results<Group>?
    var controller: GroupsTableViewController
    
    init(controller: GroupsTableViewController) {
        self.controller = controller
    }
    
    override func main() {
        guard let realm = try? Realm() else { return }
        outputGroupData = realm.objects(Group.self)
        controller.groups = outputGroupData
        controller.tableView.reloadData()
  }
}
