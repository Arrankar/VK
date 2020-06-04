//
//  Photo.swift
//  VKapp
//
//  Created by Александр on 13.05.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation
import RealmSwift

struct PhotoResponse: Decodable {
    let response: Response
    
    struct Response: Decodable {
        let items: [Photo]
    }
}

class Photo: Object, Decodable {
    @objc dynamic var image = ""
    
    enum CodingKeys: String, CodingKey {
        case image = "photo_604"
    }
}

