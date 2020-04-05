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
    
    public var friends = [User(name: "Алексей", surname: "Приходько", photo: "6.jpg", images: ["4", "6", "4", "6"]),
                   User(name: "Валерий", surname: "Иванов", photo: "4.jpg", images: ["6","6"]),
                   User(name: "Угон", surname: "Харлеев", photo: "6.jpg", images: ["6", "6", "6"])]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as! FriendsTableViewCell
        
        
        cell.friendName.text = friends[indexPath.row].name
        cell.friendSurname.text = friends[indexPath.row].surname
        cell.friendImage.avatar.image = UIImage(named: friends[indexPath.row].photo)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "imagesSegue" {
            
            if let indexPath = tableView.indexPathForSelectedRow {

                let imagesVC = segue.destination as! ImagesCollectionViewController
                imagesVC.friendsImages = friends[indexPath.row].images
            
            }
        }
    }
}
