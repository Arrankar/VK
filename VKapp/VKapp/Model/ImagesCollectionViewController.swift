//
//  ImagesCollectionViewController.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ImagesCollectionViewCell"

@available(iOS 13.0, *)
class ImagesCollectionViewController: UICollectionViewController {

    var friendsImages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return friendsImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImagesCollectionViewCell
        cell.friendPhoto.image = UIImage(named: friendsImages[indexPath.row])
        
        return cell
    }

}
