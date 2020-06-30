//
//  ApiWrapper.swift
//  VKapp
//
//  Created by Александр on 08.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift

class ApiWrapper {
    
    let baseUrl = "https://api.vk.com/method"
    
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
    
    func getGroups(controller: GroupsTableViewController) {
        
        let methodUrl = "/groups.get"
        let url = baseUrl + methodUrl
        let parameters: Parameters = [
            "user_ids" : "\(Session.instance.userId)",
            "access_token" : Session.instance.token,
            "extended" : "1",
            "fields" : "members_count",
            "v" : "5.68"
        ]
        
        let request = AF.request(url, method: .get, parameters: parameters)
        let queue = OperationQueue()
        
        let getDataOperation = GetDataOperation(request: request)
        queue.addOperation(getDataOperation)
        
        let parseGroupsData = ParseGroupsData()
        parseGroupsData.addDependency(getDataOperation)
        
        let reloadGroupsTable = ReloadGroupsTable(controller: controller)
        reloadGroupsTable.addDependency(parseGroupsData)
        OperationQueue.main.addOperation(reloadGroupsTable)
    }
    
    func getFriends() {
        let methodUrl = "/friends.get"
        let url = baseUrl + methodUrl
        let parameters: Parameters = [
            "user_ids" : "\(Session.instance.userId)",
            "access_token" : Session.instance.token,
            "fields" : "domain, photo_200_orig",
            "v" : "5.68"
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseData(queue: DispatchQueue.global()) { [weak self] response in
            guard let data = response.value else { return }
            let users = try! JSONDecoder().decode(UserResponse.self, from: data).response.items
            self?.saveData(data: users)
        }
    }
    
    func groupSearch(searchText: String, completion: @escaping ([Group]) -> ()) {
        
        let methodUrl = "/groups.search"
        let url = baseUrl + methodUrl
        let parameters: Parameters = [
            "user_ids" : "\(Session.instance.userId)",
            "access_token" : Session.instance.token,
            "extended" : "1",
            "fields" : "members_count",
            "q" : searchText.lowercased(),
            "v" : "5.73"
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseData(queue: DispatchQueue.global()) { response in
            guard let data = response.value else { return }
            let searchedGroups = try! JSONDecoder().decode(GroupResponse.self, from: data).response.items
            completion(searchedGroups)
        }
    }
    
    func getPhoto(ownerId: Int, completion: @escaping () -> Void) {
        
        let methodUrl = "/photos.getAll"
        let url = baseUrl + methodUrl
        let parameters: Parameters = [
            "user_ids" : "\(Session.instance.userId)",
            "access_token" : Session.instance.token,
            "owner_id" : "\(ownerId)",
            "v" : "5.68"
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseData(queue: DispatchQueue.global()) { [weak self] response in
            guard let data = response.value else { return }
            let photos = try! JSONDecoder().decode(PhotoResponse.self, from: data).response.items
            self?.saveData(data: photos)
            completion()
        }
    }
    
    func getNews(completion: @escaping ([News]) -> Void) {
        
        let methodUrl = "/newsfeed.get"
        let url = baseUrl + methodUrl
        let parameters: Parameters = [
            "user_ids" : "\(Session.instance.userId)",
            "access_token" : Session.instance.token,
            "filters" : "post",
            "fields" : "domain, photo_200_orig",
            "v" : "5.68"
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseData(queue: DispatchQueue.global()) { response in
            guard let data = response.value else { return }
            let news = try! JSONDecoder().decode(NewsResponse.self, from: data).response.items
            completion(news)
        }
    }
    
    func getGroupInfo(groupId: Int, completion: @escaping ([GroupInfoResponse.GroupInfo]) -> Void) {
        
        let methodUrl = "/groups.getById"
        let url = baseUrl + methodUrl
        let parameters: Parameters = [
            "access_token" : Session.instance.token,
            "group_id" : "\(groupId)",
            "v" : "5.68"
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseData(queue: DispatchQueue.global()) { response in
            guard let data = response.value else { return }
            let groupInfo = try! JSONDecoder().decode(GroupInfoResponse.self, from: data).response.items
            completion(groupInfo)
        }
    }
    
     func addGroup(groupId: Int) {
        
        let methodUrl = "/groups.join"
        let url = baseUrl + methodUrl
        let parameters: Parameters = [
            "access_token" : Session.instance.token,
            "group_id" : "\(groupId)",
            "v" : "5.68"
        ]
        
         AF.request(url, method: .get, parameters: parameters).responseData { response in
        }
    }
    
    func saveData<T: Object>(data: [T]) {
        do {
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            let realm = try Realm(configuration: config)
            let oldData = realm.objects(T.self)
            realm.beginWrite()
            realm.delete(oldData)
            realm.add(data)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
