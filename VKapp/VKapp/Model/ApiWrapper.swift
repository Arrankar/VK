//
//  ApiWrapper.swift
//  VKapp
//
//  Created by Александр on 08.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

struct ApiWrapper {

private init() {}

static var token = ""

static var authRequest: URLRequest {
    var components = URLComponents()
    
    components.scheme = "https"
    components.host = "oauth.vk.com"
    components.path = "/authorize"
    components.queryItems = [
        URLQueryItem(name: "client_id", value: "7398838"),
        URLQueryItem(name: "display", value: "mobile"),
        URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
        URLQueryItem(name: "scope", value: "262150"),
        URLQueryItem(name: "response_type", value: "token"),
        URLQueryItem(name: "v", value: "5.68")
    ]
    
    return URLRequest(url: components.url!)
    
    }
}
