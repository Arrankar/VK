//
//  Group.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit
import RealmSwift

struct GroupResponse: Decodable {
    let response: Response
    
    
    struct Response: Decodable {
        let items: [Group]
    }
}

class Group: Object, Decodable {
    @objc dynamic var groupName = ""
    @objc dynamic var membersCount = 0
    @objc dynamic var image = ""
    
    enum CodingKeys: String, CodingKey {
        case groupName = "name"
        case membersCount = "members_count"
        case image = "photo_200"
    }
}

