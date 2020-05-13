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
    
    static func getGroups(completion: @escaping ([GroupResponse.Group]) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/groups.get"
        components.queryItems = [
            URLQueryItem(name: "user_ids", value: "7398838"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "members_count"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        AF.request(components.url!).responseData { response in
            guard let data = response.value else { return }
            let groups = try! JSONDecoder().decode(GroupResponse.self, from: data).response.items
            completion(groups)
        }
    }
    
    static func getFriends(completion: @escaping ([UserResponse.User]) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/friends.get"
        components.queryItems = [
            URLQueryItem(name: "user_ids", value: "7398838"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "fields", value: "domain, photo_200_orig"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        AF.request(components.url!).responseData { response in
            guard let data = response.value else { return }
            let users = try! JSONDecoder().decode(UserResponse.self, from: data).response.items
            completion(users)
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
    
    static func getPhoto(ownerId: Int, completion: @escaping ([PhotoResponse.Photo]) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/photos.getAll"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "owner_id", value: "\(ownerId)"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        AF.request(components.url!).responseData { response in
            guard let data = response.value else { return }
            let photos = try! JSONDecoder().decode(PhotoResponse.self, from: data).response.items
            completion(photos)
        }
    }
}
