//
//  NewsFeedTableViewCell.swift
//  VKapp
//
//  Created by Александр on 25.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class NewsFeedTableViewCell: UITableViewCell {
   
    @IBOutlet private weak var imagesCollection: GalleryCollectionView!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var newsImage: UIImageView!
    @IBOutlet private weak var newsNameLabel: UILabel!
    @IBOutlet private weak var newsDateLabel: UILabel!
    @IBOutlet private weak var postTextLabel: UILabel!
    @IBOutlet private weak var likeView: LikeButton!
    @IBOutlet private weak var commentsVIew: CommentsView!
    @IBOutlet private weak var repostView: RepostView!
    @IBOutlet private weak var viewsView: ViewsView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        selectionStyle = .none
        
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        
        likeView.backgroundColor = .clear
        commentsVIew.backgroundColor = .clear
        viewsView.backgroundColor = .clear
        repostView.backgroundColor = .clear
        
        newsImage.layer.cornerRadius = newsImage.frame.width / 2
        imagesCollection.register(UINib(nibName: "ImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImagesCollectionViewCell")
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        flowlayout.itemSize = CGSize(width: 200, height: 200)
        flowlayout.minimumInteritemSpacing = 1.0
        imagesCollection.collectionViewLayout = flowlayout
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imagesCollection.reloadData()
        imagesCollection.layer.cornerRadius = 10

    }
    
    func configure(with news: News) {
        newsDateLabel.text = Date(timeIntervalSince1970: news.date).timeAgo(numericDates: false)
        postTextLabel.text = news.text
        viewsView.label.text = String(news.viewsCount)
        repostView.label.text = String(news.repostsCount)
        commentsVIew.label.text = String(news.commentsCount)
        likeView.label.text = String(news.likesCount)
    }
}
