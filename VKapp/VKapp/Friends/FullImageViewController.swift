//
//  FullImageVCViewController.swift
//  VKapp
//
//  Created by Александр on 07.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit


class FullImageViewController: UIViewController {

    @IBOutlet weak var fullImage: UIImageView!
    @IBOutlet weak var dotsView: DotsView!
    
    var currentPhoto: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullImage.image = currentPhoto
    }
}
