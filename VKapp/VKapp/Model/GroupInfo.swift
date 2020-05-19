//
//  GroupInfo.swift
//  VKapp
//
//  Created by Александр on 14.05.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

struct GroupInfoResponse: Decodable {
    let response: [GroupInfo]

     class GroupInfo: Decodable {
        dynamic var groupName = ""
        dynamic var image = ""
        
        enum ItemsKeys: String, CodingKey {
            case groupName = "name"
            case image = "photo_200"
        }
        
        convenience required init(from decoder: Decoder) throws {
            self.init()
            let values = try decoder.container(keyedBy: ItemsKeys.self)
            self.groupName = try values.decode(String.self, forKey: .groupName)
            self.image = try values.decode(String.self, forKey: .image)
        }
    }
}
