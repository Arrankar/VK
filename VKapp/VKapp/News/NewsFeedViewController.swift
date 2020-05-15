//
//  NewsFeedViewController.swift
//  VKapp
//
//  Created by Александр on 25.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class NewsFeedViewController: UIViewController {
    
    @IBOutlet weak var newsFeedTableView: UITableView!
    
    var newsArray = [NewsResponse.News]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsFeedTableView.delegate = self
        newsFeedTableView.dataSource = self
        newsFeedTableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsFeedTableViewCell")
        newsFeedTableView.separatorStyle = .none
        newsFeedTableView.backgroundColor = .clear
        view.backgroundColor = #colorLiteral(red: 0.7681049705, green: 1, blue: 0.9786186814, alpha: 1)
        
//        ApiWrapper.getNews { [weak self] news in
//            self?.newsArray = news
//            self?.newsFeedTableView.reloadData()
//        }
    }
}


@available(iOS 13.0, *)
extension NewsFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedTableViewCell", for: indexPath) as! NewsFeedTableViewCell
        let news = newsArray[indexPath.row]
        cell.postTextLabel.text = news.text
        cell.commentsVIew.label.text = String(news.commentsCount)
        cell.likeView.label.text = String(news.likesCount)
        cell.repostView.label.text = String(news.repostsCount)
        cell.viewsView.label.text = String(news.viewsCount)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        400
    }
}


