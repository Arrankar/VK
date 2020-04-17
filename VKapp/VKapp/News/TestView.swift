//
//  TestView.swift
//  VKapp
//
//  Created by Александр on 11.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class TestView: UIView {
    
    var arrayOfPics = [String?]()
    var picX = 0
    var picY = 0
    let picWidth = 200
    let picHeight = 200
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for index in arrayOfPics {
            if let element = index {
                if arrayOfPics.count > 1 {
                    let imageView = UIImageView(image: UIImage(named: element))
                    imageView.frame = CGRect(x: picX, y: picY, width: picWidth, height: picHeight)
                    addSubview(imageView)
                    picX = picX + picWidth
                    if picX > Int(bounds.width) {
                        picX = 0
                        picY = picHeight + picY + 10
                    }
                }
                else {
                    let imageView = UIImageView(image: UIImage(named: element))
                    imageView.frame = CGRect(x: picX, y: picY, width: Int(bounds.width), height: Int(bounds.height))
                    addSubview(imageView)
                }
            }
        }
    }
}

