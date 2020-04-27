//
//  GalleryCollectionView.swift
//  VKapp
//
//  Created by Александр on 26.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class GalleryCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var images = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        delegate = self
        dataSource = self

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionViewCell", for: indexPath) as! ImagesCollectionViewCell
        cell.galleryImage.image = UIImage(named: images[indexPath.item])
        
        return cell
    }
    


}


