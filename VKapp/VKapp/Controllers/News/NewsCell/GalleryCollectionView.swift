//
//  GalleryCollectionView.swift
//  VKapp
//
//  Created by Александр on 26.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class GalleryCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
//    var images = [Attachments]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        delegate = self
        dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      1
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionViewCell", for: indexPath) as! ImagesCollectionViewCell
            return cell
    }
    
    
    
}


