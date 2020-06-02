//
//  AuthUsers.swift
//  VKapp
//
//  Created by Александр on 02.06.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation
import Firebase

class AuthUsers {

    let id: Int
    let zipcode: Int
    let ref: DatabaseReference?
    
    init(id: Int, zipcode: Int) {
      
        self.ref = nil
        self.id = id
        self.zipcode = zipcode
    }
    
    init?(snapshot: DataSnapshot) {
       
        guard
            let value = snapshot.value as? [String: Any],
            let zipcode = value["zipcode"] as? Int,
            let id = value["id"] as? Int else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.id = id
        self.zipcode = zipcode
    }
    
    func toAnyObject() -> [String: Any] {
       
        return [
            "id": id,
            "zipcode": zipcode
        ]
    }
}

