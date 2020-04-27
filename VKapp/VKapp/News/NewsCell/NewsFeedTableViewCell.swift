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
   
    @IBOutlet weak var imagesCollection: GalleryCollectionView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsNameLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var likeView: LikeButton!
    @IBOutlet weak var commentsVIew: CommentsView!
    @IBOutlet weak var repostView: RepostView!
    @IBOutlet weak var viewsView: ViewsView!
    
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
}
