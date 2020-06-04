//
//  ImagesCollectionViewCell.swift
//  VKapp
//
//  Created by Александр on 26.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var galleryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        galleryImage.layer.cornerRadius = 10
        galleryImage.layer.borderColor = UIColor.red.cgColor
    }

}
