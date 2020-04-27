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
    
    let newsArray = [News(newsSourse: "Животные", newsDate: "23.08.19",      newsSourseImage: "4", newsText: "Все о животном мире. Про домашних животных и про диких, про птиц тоже здесь будет и про насекомых", newsImage: ["4", "6", "hotel"]),
                     
                     News(newsSourse: "Здоровье", newsDate: "12.01.20", newsSourseImage: "6", newsText: "Все про коронавирус будет написано здесь", newsImage: ["nauka"]),
                     
                     News(newsSourse: "Знаменитости", newsDate: "12.04.20", newsSourseImage: "1", newsText: "Много текста о знаменитостях, их жизни, жизни их домашних животных, тачках и виллах ", newsImage: ["jeep"]),
                     
                     News(newsSourse: "Техника", newsDate: "23.08.19",      newsSourseImage: "4", newsText: "Здесь будут новости про технику, компы, танки, самолеты, все про это", newsImage: ["flower", "cake"]),
                     
                     News(newsSourse: "Техника", newsDate: "23.08.19",      newsSourseImage: "nauka", newsText: "Здесь будут новости про технику, компы, танки, самолеты, все про это", newsImage: ["jeep", "cake", "flower", "hotel"])]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsFeedTableView.delegate = self
        newsFeedTableView.dataSource = self
        newsFeedTableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsFeedTableViewCell")
        newsFeedTableView.separatorStyle = .none
        newsFeedTableView.backgroundColor = .clear
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
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
        cell.newsDateLabel.text = news.newsDate
        cell.imagesCollection.images = news.newsImage
        cell.postTextLabel.text = news.newsText
        cell.newsNameLabel.text = news.newsSourse
        cell.newsImage.image = UIImage(named: news.newsSourseImage)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        400
    }
}


