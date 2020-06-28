//
//  ParseGroupsData.swift
//  VKapp
//
//  Created by Александр on 28.06.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation
import RealmSwift

class ParseGroupsData: Operation {

    var apiWrapper = ApiWrapper()
    
    override func main() {
        guard let getDataOperation = dependencies.first as? GetDataOperation,
            let data = getDataOperation.data else { return }
        let groups = try! JSONDecoder().decode(GroupResponse.self, from: data).response.items
        apiWrapper.saveData(data: groups)
    }
}

