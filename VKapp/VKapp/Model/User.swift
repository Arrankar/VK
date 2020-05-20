//
//  User.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit
import RealmSwift

struct UserResponse: Decodable {
    let response: Response
    
    
    struct Response: Decodable {
        let items: [User]
    }
}
    class User: Object, Decodable {
       @objc dynamic var id = 0
       @objc dynamic var firstName = ""
       @objc dynamic var lastName = ""
       @objc dynamic var image = ""
        
        enum CodingKeys: String, CodingKey {
            case id
            case firstName = "first_name"
            case lastName = "last_name"
            case image = "photo_200_orig"
        }
    }

