//
//  FullImageVCViewController.swift
//  VKapp
//
//  Created by Александр on 07.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit


class FullImageViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var fullImage: UIImageView!
    
    var currentPhoto: UIImage!
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == UISwipeGestureRecognizer.Direction.down {
            dismiss(animated: true, completion: nil) }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullImage.layer.cornerRadius = 40
        fullImage.isUserInteractionEnabled = true
        let transform = CGAffineTransform(rotationAngle: -.pi/2)
        fullImage.layer.setAffineTransform(transform)
        fullImage.image = currentPhoto
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        fullImage.addGestureRecognizer(swipeDown)
        
        
    }
    
    
    
}

