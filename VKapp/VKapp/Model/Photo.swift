//
//  Photo.swift
//  VKapp
//
//  Created by Александр on 13.05.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

struct PhotoResponse: Decodable {
    let response: Response
    
    
     struct Response: Decodable {
        let items: [Photo]
    }
    
     class Photo: Decodable {
        dynamic var image = ""
        
        enum ItemsKeys: String, CodingKey {
            case image = "photo_604"
        }
        
        convenience required init(from decoder: Decoder) throws {
            self.init()
            let values = try decoder.container(keyedBy: ItemsKeys.self)
            self.image = try values.decode(String.self, forKey: .image)
        }
    }
}
