//
//  GroupInfo.swift
//  VKapp
//
//  Created by Александр on 14.05.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

struct GroupInfoResponse: Decodable {
    let response: Response
    
    struct Response: Decodable {
        let items: [GroupInfo]
    }

     class GroupInfo: Decodable {
         var groupName = ""
         var image = ""
        
        enum CodingKeys: String, CodingKey {
            case groupName = "name"
            case image = "photo_200"
        }
    }
}
