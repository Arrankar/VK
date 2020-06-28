//
//  ReloadGroupsTable.swift
//  VKapp
//
//  Created by Александр on 28.06.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

class ReloadGroupsTable: Operation {
    var controller: GroupsTableViewController
    
    init(controller: GroupsTableViewController) {
        self.controller = controller
    }
    
    override func main() {
        guard let parseGroupsData = dependencies.first as? ParseGroupsData else { return }
        controller.groups = parseGroupsData.outputGroupData
        controller.tableView.reloadData()
  }
}
