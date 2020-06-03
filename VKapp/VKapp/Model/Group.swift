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
    @objc dynamic var id = 0
    @objc dynamic var groupName = ""
    @objc dynamic var membersCount = 0
    @objc dynamic var image = ""
    var isMember = 0
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case isMember = "is_member"
        case groupName = "name"
        case membersCount = "members_count"
        case image = "photo_200"
    }
    
    func toAnyObject() -> [String: Any] {
        return [
            "name": groupName,
            "Count of members": membersCount
        ]
    }
}

