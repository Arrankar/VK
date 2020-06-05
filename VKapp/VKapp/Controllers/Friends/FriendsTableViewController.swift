//
//  FriendsTableViewController.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

@available(iOS 13.0, *)

class FriendsTableViewController: UITableViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var textFieldConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var imageConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonWidth: NSLayoutConstraint!
    @IBOutlet weak var buttonConstraint: NSLayoutConstraint!
    
    var friends: Results<User>!
    var token: NotificationToken?
    var filteredFriends = [User]()
    let apiWapper = ApiWrapper()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        self.buttonWidth.constant = 0
        self.imageConstraint.constant = 10 + searchTextField.frame.width / 2
        apiWapper.getFriends()
        pairTableAndRealm()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredFriends.count
        }
       
        return friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as! FriendsTableViewCell
        
        cell.contentView.alpha = 0
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.3,
                       options: [],
                       animations: {
                        cell.frame.origin.x -= 100
        })
        if !isSearching {
            cell.friendName.text = friends[indexPath.row].firstName
            cell.friendSurname.text = friends[indexPath.row].lastName
            let url = URL(string: friends[indexPath.row].image)
            cell.friendImage.avatar.image = UIImage(data: try! Data(contentsOf: url!))!
        } else {
            cell.friendName.text = filteredFriends[indexPath.row].firstName
            cell.friendSurname.text = filteredFriends[indexPath.row].lastName
            let url = URL(string: filteredFriends[indexPath.row].image)
            cell.friendImage.avatar.image = UIImage(data: try! Data(contentsOf: url!))!
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! FriendsTableViewCell
        UIView.animate(withDuration: 1, animations: {
            cell.contentView.alpha = 1
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "imagesSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let imagesVC = segue.destination as! SwipeImageViewController
                imagesVC.friendId = friends[indexPath.row].id
            }
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.25, animations: {
            self.buttonWidth.constant = 0
            self.view.layoutIfNeeded()
        })
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.3,
                       options: [],
                       animations: {
                        self.imageConstraint.constant = 10 +  self.searchTextField.frame.width / 2
                        self.textFieldConstraint.constant = 10
                        self.view.layoutIfNeeded()
        })
        searchTextField.text = ""
        searchTextField.endEditing(true)
        isSearching = false
        tableView.reloadData()
    }
}

@available(iOS 13.0, *)
extension FriendsTableViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.25, animations: {
            self.buttonWidth.constant = 50
            self.textFieldConstraint.constant = 15 + self.searchImage.frame.width
            self.view.layoutIfNeeded()
        })
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.3,
                       options: [],
                       animations: {
                        self.imageConstraint.constant = 10
                        self.view.layoutIfNeeded()
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = self.searchTextField.text
        
        if searchTextField.text == "" {
            filteredFriends = Array(friends)
            tableView.reloadData()
            isSearching = false
        } else {
            if let fieldText = text {
                let filteredUsers = friends.filter({ (friend: User) -> Bool in
                    return friend.fullName.lowercased().contains(fieldText.lowercased())
                })
                filteredFriends = Array(filteredUsers)
            }
            isSearching = true
            tableView.reloadData()
            searchTextField.endEditing(true)
        }
        return true
    }
}

extension FriendsTableViewController {
    
    func pairTableAndRealm() {
        let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        guard let realm = try? Realm(configuration: config) else { return }
        
       
        friends = realm.objects(User.self)
        token = friends.observe { [weak self] changes in
            guard let tableView = self?.tableView else { return }
            switch changes {
            case .initial:
                tableView.reloadData()
            case let .update(_,  deletions, insertions, modifications):
                tableView.beginUpdates()
                tableView.insertRows(at: insertions.map(    { IndexPath(row: $0, section: 0)}), with: .none)
                tableView.deleteRows(at: deletions.map(     { IndexPath(row: $0, section: 0)}), with: .none)
                tableView.reloadRows(at: modifications.map( { IndexPath(row: $0, section: 0)}), with: .none)
                tableView.endUpdates()
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }
}

