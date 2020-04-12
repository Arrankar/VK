//
//  FriendsTableViewController.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)

class FriendsTableViewController: UITableViewController {
    
    @IBOutlet weak var friendsSearchBar: UISearchBar!
    
    var friends = [User(name: "Алексей", surname: "Приходько", photo: "1.jpg", images: ["4", "6", "nauka", "1"]),
                   User(name: "Валерий", surname: "Иванов", photo: "4.jpg", images: ["6","1"]),
                   User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),
                   User(name: "Харольд", surname: "Алексеев", photo: "4", images: ["6"])
    ]
    
    var friendSection = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsSearchBar.delegate = self
        sortedFriends(friends: friends)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendSection.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendSection[section].title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendSection[section].items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as! FriendsTableViewCell
        
        cell.friendName.text = friendSection[indexPath.section].items[indexPath.row].name
        cell.friendSurname.text = friendSection[indexPath.section].items[indexPath.row].surname
        cell.friendImage.avatar.image = UIImage(named: friendSection[indexPath.section].items[indexPath.row].photo)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "imagesSegue" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let imagesVC = segue.destination as! ImagesCollectionViewController
                imagesVC.friendsImages = friendSection[indexPath.section].items[indexPath.row].images
            }
        }
    }
    
    func sortedFriends(friends: [User]) {
        let userDictionary = Dictionary.init(grouping: friends)
        { $0.surname.prefix(1) }
        friendSection = userDictionary.map {Section(title: String($0.key), items: $0.value)}
        friendSection.sort {$0.title < $1.title }
    }
}

@available(iOS 13.0, *)
extension FriendsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            sortedFriends(friends: friends)
        } else {
            let filteredUsers = friends.filter({ (friend: User) -> Bool in
                return friend.fullName.lowercased().contains(searchText.lowercased())
            })
            sortedFriends(friends: filteredUsers)
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        sortedFriends(friends: friends)
        tableView.reloadData()
    }
}
