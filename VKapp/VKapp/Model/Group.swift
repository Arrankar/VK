//
//  Group.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

struct GroupResponse: Decodable {
    let response: Response
    
    
     struct Response: Decodable {
        let items: [Group]
    }
    
     class Group: Decodable {
        dynamic var groupName = ""
        dynamic var membersCount = 0
        dynamic var image = ""
        
        enum ItemsKeys: String, CodingKey {
            case groupName = "name"
            case membersCount = "members_count"
            case image = "photo_200"
        }
        
        convenience required init(from decoder: Decoder) throws {
            self.init()
            let values = try decoder.container(keyedBy: ItemsKeys.self)
            self.groupName = try values.decode(String.self, forKey: .groupName)
            self.membersCount = try values.decode(Int.self, forKey: .membersCount)
            self.image = try values.decode(String.self, forKey: .image)
        }
    }
}
