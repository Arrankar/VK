//
//  dotsView.swift
//  VKapp
//
//  Created by Александр on 14.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class DotsView: UIView {
    
    
    @IBOutlet weak var firstDot: UIView!
    @IBOutlet weak var secondDot: UIView!
    @IBOutlet weak var thirdDot: UIView!
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        firstDot.layer.cornerRadius = firstDot.bounds.height / 2
        secondDot.layer.cornerRadius = secondDot.bounds.height / 2
        thirdDot.layer.cornerRadius = thirdDot.bounds.height / 2
    }
}
