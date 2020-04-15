//
//  avatarView.swift
//  VKapp
//
//  Created by Александр on 04.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class AvatarView: UIView {
    
    @IBOutlet weak var avatar: UIImageView!
    

    

    @IBInspectable
    var shadowOpacity: Float = 0.0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor = .clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = 0.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        

        
        avatar.layer.cornerRadius = bounds.height / 2
        layer.cornerRadius = bounds.height / 2
        layer.shadowOffset = CGSize(width: 10, height: 5)
    }
}


