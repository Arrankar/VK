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
            URLQueryItem(name: "scope", value: "270342"),
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
    
    static func groupSearch(searchText: String, completion: @escaping ([GroupResponse.Group]) -> ()) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/groups.search"
        components.queryItems = [
            URLQueryItem(name: "user_ids", value: "7398838"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "members_count"),
            URLQueryItem(name: "q", value: searchText.lowercased()),
            URLQueryItem(name: "v", value: "5.73")
        ]
        
        AF.request(components.url!).responseData { response in
            guard let data = response.value else { return }
            let searchedGroups = try! JSONDecoder().decode(GroupResponse.self, from: data).response.items
            completion(searchedGroups)
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
    
    static func getNews(completion: @escaping ([NewsResponse.News]) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/newsfeed.get"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "filters", value: "post,photo,photo_tag, wall_photo"),
            URLQueryItem(name: "count", value: "50"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        AF.request(components.url!).responseData { response in
            guard let data = response.value else { return }
            let news = try! JSONDecoder().decode(NewsResponse.self, from: data).response.items
            completion(news)
        }
    }
    
    static func getGroupInfo(ownerId: Int, completion: @escaping ([GroupInfoResponse.GroupInfo]) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/groups.getById"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "group_id", value: "\(ownerId)"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        AF.request(components.url!).responseData { response in
            guard let data = response.value else { return }
            let groupInfo = try! JSONDecoder().decode(GroupInfoResponse.self, from: data).response
            completion(groupInfo)
        }
    }
}
