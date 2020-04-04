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

    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatar.layer.cornerRadius = bounds.height / 2
        layer.cornerRadius = bounds.height / 2
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 10, height: 5)
    }
}


