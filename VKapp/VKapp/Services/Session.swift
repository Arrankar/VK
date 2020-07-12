//
//  Session.swift
//  VKapp
//
//  Created by Александр on 02.05.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit


class Session {
    
    static let instance = Session()
    
    private init() {}
    
    var token = ""
    var userId = 0
    var nextFrom = ""
}



