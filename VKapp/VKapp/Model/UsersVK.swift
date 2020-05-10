//
//  UsersVK.swift
//  VKapp
//
//  Created by Александр on 08.05.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class UserResponse: Decodable {
 
    let response: UsersVK
}

class UsersVK: Decodable {

    dynamic var cnt = 0
    
    enum CodingKeys: String, CodingKey {
        case cnt = "count"
    }
    
    convenience required init(from decoder: Decoder) throws {
            self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.cnt = try values.decode(Int.self, forKey: .cnt)
        
    }
}
