//
//  ApiWrapper.swift
//  VKapp
//
//  Created by Александр on 08.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation
import Alamofire

struct ApiWrapper {
    
    private init() {}
    
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
    
    static func getGroups() {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/groups.get"
        components.queryItems = [
            URLQueryItem(name: "user_ids", value: "7398838"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        AF.request(components.url!).responseJSON { response in
                   print(response)
        }
    }
    
    static func getFriends() {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/friends.get"
        components.queryItems = [
            URLQueryItem(name: "user_ids", value: "7398838"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "fields", value: "domain"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        AF.request(components.url!).responseJSON { response in
            print(response)
        }
    }
    
    static func groupSearch() {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/groups.search"
        components.queryItems = [
            URLQueryItem(name: "user_ids", value: "7398838"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "q", value: "Пикабу"),
            URLQueryItem(name: "v", value: "5.73")
        ]
        
        AF.request(components.url!).responseJSON { response in
            print(response)
        }
    }
    
    static func getPhoto() {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/photos.getAll"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "owner_id", value: "523842492"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        AF.request(components.url!).responseJSON { response in
            print(response)
        }
    }
}
