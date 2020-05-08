//
//  User.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

struct User {
    var name: String
    var surname: String
    var photo: String
    var images: [String]
    var fullName: String {
        get {
            return "\(name) \(surname)"
        }
    }
}

struct Section {
    let title: String
    var items: [User]
}


struct Users: Codable {
    var response: Response
}

struct Response: Codable {
    var count: Int
    var items: [Items]
}

struct Items: Codable {
//    var id: Int
    var name: String
}

struct Groups: Codable {
    var response: Response
}

