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
    
  
    let galleryView: GalleryCollectionView? = nil
    private var refreshControl: UIRefreshControl?
    var newsArray = [News]()
    let apiWrapper = ApiWrapper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsFeedTableView.delegate = self
        newsFeedTableView.dataSource = self
        newsFeedTableView.prefetchDataSource = self
        newsFeedTableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsFeedTableViewCell")
        newsFeedTableView.separatorStyle = .none
        newsFeedTableView.backgroundColor = .clear
        view.backgroundColor = #colorLiteral(red: 0.7681049705, green: 1, blue: 0.9786186814, alpha: 1)
        
        apiWrapper.getNews(startFrom: "") { [weak self] news in
            self?.newsArray = news.items
            DispatchQueue.main.async {
            self?.newsFeedTableView.reloadData()
            }
        }
        configureRefreshControl()
    }
    
    private func configureRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Loading...")
        refreshControl?.tintColor = .red
        refreshControl?.addTarget(self, action: #selector(refreshNews), for: .valueChanged)
        newsFeedTableView.refreshControl = refreshControl
    }
    
    @objc func refreshNews() {
        refreshControl?.beginRefreshing()
        let mostFreshNews = newsArray.first?.date ?? Date().timeIntervalSince1970
        apiWrapper.getNews(startFrom: String(mostFreshNews)) { [weak self] news in
            guard let self = self else { return }
            DispatchQueue.main.async {
                 self.refreshControl?.endRefreshing()
            }
            guard news.items.count > 0 else { return }
            self.newsArray = news.items + self.newsArray
            let indexPathes = news.items.enumerated().map { offset, element in
                IndexPath(row: offset, section: 0)
            }
            DispatchQueue.main.async {
                self.newsFeedTableView.insertRows(at: indexPathes, with: .automatic)
            }
        }
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
        cell.configure(with: news)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension NewsFeedViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard indexPaths.contains(where: isLoadingCell(for:)) else {
            return
        }
        
        apiWrapper.getNews(startFrom: Session.instance.nextFrom) { [weak self] news in
            guard let self = self else { return }
            self.newsArray = self.newsArray + news.items
            DispatchQueue.main.async {
                 self.newsFeedTableView.reloadData()
            }
        }
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row == (self.newsArray.count - 3)
    }
}


