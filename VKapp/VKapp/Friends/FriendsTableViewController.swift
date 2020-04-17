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
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var textFieldConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var imageConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonWidth: NSLayoutConstraint!
    @IBOutlet weak var buttonConstraint: NSLayoutConstraint!
    
    var friends = [User(name: "Алексей", surname: "Приходько", photo: "1.jpg", images: ["4", "6", "nauka", "1"]),
                   User(name: "Валерий", surname: "Иванов", photo: "4.jpg", images: ["6","1"]),
                   User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),
                   User(name: "Харольд", surname: "Алексеев", photo: "4", images: ["6"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"]),User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["4", "6", "nauka"])
    ]
    
    var friendSection = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        sortedFriends(friends: friends)
        self.buttonWidth.constant = 0
        self.imageConstraint.constant = 10 + searchTextField.frame.width / 2
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
        
        cell.contentView.alpha = 0
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.3,
                       options: [],
                       animations: {
                        cell.frame.origin.x -= 100
        })
        
        cell.friendName.text = friendSection[indexPath.section].items[indexPath.row].name
        cell.friendSurname.text = friendSection[indexPath.section].items[indexPath.row].surname
        cell.friendImage.avatar.image = UIImage(named: friendSection[indexPath.section].items[indexPath.row].photo)
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
        sortedFriends(friends: friends)
        searchTextField.endEditing(true)
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
            sortedFriends(friends: friends)
        } else {
            if let fieldText = text {
                let filteredUsers = friends.filter({ (friend: User) -> Bool in
                    return friend.fullName.lowercased().contains(fieldText.lowercased())
                })
                sortedFriends(friends: filteredUsers)
            }
            
            tableView.reloadData()
            searchTextField.endEditing(true)
        }
        return true
    }
}
