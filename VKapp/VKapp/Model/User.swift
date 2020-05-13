//
//  User.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

struct UserResponse: Decodable {
    let response: Response


struct Response: Decodable {
    let items: [User]
}

public class User: Decodable {
    dynamic var id = 0
    dynamic var firstName = ""
    dynamic var lastName = ""
    dynamic var image = ""
    
    enum ItemsKeys: String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastNmae = "last_name"
        case image = "photo_200_orig"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: ItemsKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.firstName = try values.decode(String.self, forKey: .firstName)
        self.lastName = try values.decode(String.self, forKey: .lastNmae)
        self.image = try values.decode(String.self, forKey: .image)
        }
    }
}
