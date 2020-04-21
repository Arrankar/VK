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

    @IBOutlet weak var firstDot1: UIView! {
        didSet {
             firstDot1.layer.cornerRadius = firstDot1.bounds.height / 2
        }
    }
    @IBOutlet weak var secondDot1: UIView! {
        didSet {
            secondDot1.layer.cornerRadius = secondDot1.bounds.height / 2
        }
    }
    @IBOutlet weak var thirdDot1: UIView! {
        didSet {
            thirdDot1.layer.cornerRadius = thirdDot1.bounds.height / 2
        }
    }
    
    @IBOutlet weak var testsss: UIView!
    
    var currentPhoto: UIImage!

    override func viewWillAppear(_ animated: Bool) {
        
                UIView.animate(withDuration: 1, delay: 0, options: [.repeat], animations: {
            self.firstDot1.alpha -= 1
        }, completion: nil)

        UIView.animate(withDuration: 1, delay: 0.25, options: [.repeat], animations: {
            self.secondDot1.alpha -= 1
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 0.5, options: [.repeat], animations: {
            self.thirdDot1.alpha -= 1
        }, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 2, execute: {
            self.firstDot1.layer.removeAllAnimations()
            self.secondDot1.layer.removeAllAnimations()
            self.thirdDot1.layer.removeAllAnimations()
        })
    }
}

