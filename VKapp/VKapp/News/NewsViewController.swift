//
//  News.swift
//  VKapp
//
//  Created by Александр on 11.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    
    let newsArray = [News(newsSourse: "Животные", newsDate: "23.08.19",      newsSourseImage: "4", newsText: "Все о животном мире. Про домашних животных и про диких, про птиц тоже здесь будет и про насекомых", newsImage: ["jeep", "flower", "hotel"]),
                     News(newsSourse: "Здоровье", newsDate: "12.01.20", newsSourseImage: "6", newsText: "Все про коронавирус будет написано здесь", newsImage: ["nauka","4","cake","4","jeep"]),
                     News(newsSourse: "Знаменитости", newsDate: "12.04.20", newsSourseImage: "1", newsText: "Много текста о знаменитостях, их жизни, жизни их домашних животных, тачках и виллах ", newsImage: ["1","cake","hotel","jeep", "6", "4"]),
                     News(newsSourse: "Техника", newsDate: "23.08.19",      newsSourseImage: "4", newsText: "Здесь будут новости про технику, компы, танки, самолеты, все про это", newsImage: ["flower", "6"]),
                     News(newsSourse: "Техника", newsDate: "23.08.19",      newsSourseImage: "nauka", newsText: "Здесь будут новости про технику, компы, танки, самолеты, все про это", newsImage: ["6"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.dataSource = self
        newsTableView.delegate = self
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        let news = newsArray[indexPath.row]
        cell.newsSourseLabel.text = news.newsSourse
        cell.newsDateLabel.text = news.newsDate
        cell.newsTextLabel.text = news.newsText
        cell.newsSourseImage.avatar.image = UIImage(named: news.newsSourseImage)
        cell.moreImageView.arrayOfPics = news.newsImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        600
    }
    
}


