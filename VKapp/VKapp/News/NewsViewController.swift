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
    
    let newsArray = [News(newsSourse: "Животные", newsDate: "23.08.19",      newsSourseImage: "4", newsText: "Все о животном мире. Про домашних животных и про диких, про птиц тоже здесь будет и про насекомых", newsImage: [nil]),
                     News(newsSourse: "Здоровье", newsDate: "12.01.20", newsSourseImage: "6", newsText: "Все про коронавирус будет написано здесь", newsImage: ["nauka","4","4","4","4"]),
                     News(newsSourse: "Знаменитости", newsDate: "12.04.20", newsSourseImage: "1", newsText: "Много текста о знаменитостях, их жизни, жизни их домашних животных, тачках и виллах ", newsImage: ["6","4","4","4","4","4"]),
                     News(newsSourse: "Техника", newsDate: "23.08.19",      newsSourseImage: "4", newsText: "Здесь будут новости про технику, компы, танки, самолеты, все про это", newsImage: [nil])]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.dataSource = self
        newsTableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        let news = newsArray[indexPath.row]
        cell.newsSourseLabel.text = news.newsSourse
        cell.newsDateLabel.text = news.newsDate
        cell.newsTextLabel.text = news.newsText
        if !news.newsImage.contains(nil) {
            cell.newsTestView.arrayOfPics = news.newsImage
        }
        cell.newsSourseImage.avatar.image = UIImage(named: news.newsSourseImage)
        return cell
    }
    
    
}


