//
//  MoreImagesView.swift
//  VKapp
//
//  Created by Александр on 26.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class MoreImagesView: UIView {
    
    var arrayOfPics = [String]()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .blue
        
        
        switch arrayOfPics.count {
        case 1:
            let imageView = UIImageView(image: UIImage(named: arrayOfPics[0]))
            self.addSubview(imageView)
            imageView.widthAnchor.constraint(equalToConstant: self.bounds.width).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: self.bounds.height).isActive = true
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
        case 2:
            let firstImageView = UIImageView(image: UIImage(named: arrayOfPics[0]))
            let secondImageView = UIImageView(image: UIImage(named: arrayOfPics[1]))
            self.addSubview(firstImageView)
            self.addSubview(secondImageView)
            
            
            firstImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            firstImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            firstImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            firstImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -self.bounds.height / 2).isActive = true
            firstImageView.translatesAutoresizingMaskIntoConstraints = false
            
            secondImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height / 2).isActive = true
            secondImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            secondImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            secondImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            secondImageView.translatesAutoresizingMaskIntoConstraints = false
            
        case 3:
                let firstImageView = UIImageView(image: UIImage(named: arrayOfPics[0]))
                let secondImageView = UIImageView(image: UIImage(named: arrayOfPics[1]))
                let thirdImageView = UIImageView(image: UIImage(named: arrayOfPics[2]))
                self.addSubview(firstImageView)
                self.addSubview(secondImageView)
                self.addSubview(thirdImageView)
            
                firstImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
                firstImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
                firstImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
                firstImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -self.bounds.height / 2).isActive = true
                firstImageView.translatesAutoresizingMaskIntoConstraints = false
            
                secondImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height / 2).isActive = true
                secondImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
                secondImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.bounds.width / 2).isActive = true
                secondImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
                secondImageView.translatesAutoresizingMaskIntoConstraints = false
            
                thirdImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height / 2).isActive = true
                thirdImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width / 2).isActive = true
                thirdImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
                thirdImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
                thirdImageView.translatesAutoresizingMaskIntoConstraints = false
        case 4:
            let firstImageView = UIImageView(image: UIImage(named: arrayOfPics[0]))
            let secondImageView = UIImageView(image: UIImage(named: arrayOfPics[1]))
            let thirdImageView = UIImageView(image: UIImage(named: arrayOfPics[2]))
            let firthImageView = UIImageView(image: UIImage(named: arrayOfPics[3]))
            self.addSubview(firstImageView)
            self.addSubview(secondImageView)
            self.addSubview(thirdImageView)
            self.addSubview(firthImageView)
            firstImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            firstImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            firstImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.bounds.width / 2).isActive = true
            firstImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -self.bounds.height / 2).isActive = true
            firstImageView.translatesAutoresizingMaskIntoConstraints = false
            
            secondImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height / 2).isActive = true
            secondImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            secondImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.bounds.width / 2).isActive = true
            secondImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            secondImageView.translatesAutoresizingMaskIntoConstraints = false
            
            thirdImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height / 2).isActive = true
            thirdImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width / 2).isActive = true
            thirdImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            thirdImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            thirdImageView.translatesAutoresizingMaskIntoConstraints = false
            
            firthImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            firthImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width / 2).isActive = true
            firthImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            firthImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -self.bounds.height / 2).isActive = true
            firthImageView.translatesAutoresizingMaskIntoConstraints = false
        
        case 5... :
            let firstImageView = UIImageView(image: UIImage(named: arrayOfPics[0]))
            let secondImageView = UIImageView(image: UIImage(named: arrayOfPics[1]))
            let thirdImageView = UIImageView(image: UIImage(named: arrayOfPics[2]))
            let firthImageView = UIImageView(image: UIImage(named: arrayOfPics[3]))
            let moreView = UIView()
            let moreLabel = UILabel()
            self.addSubview(firstImageView)
            self.addSubview(secondImageView)
            self.addSubview(thirdImageView)
            self.addSubview(firthImageView)
            self.addSubview(moreView)
            self.addSubview(moreLabel)
            
            firstImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            firstImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            firstImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.bounds.width / 2).isActive = true
            firstImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -self.bounds.height / 2).isActive = true
            firstImageView.translatesAutoresizingMaskIntoConstraints = false
            
            secondImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height / 2).isActive = true
            secondImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            secondImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.bounds.width / 2).isActive = true
            secondImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            secondImageView.translatesAutoresizingMaskIntoConstraints = false
            
            thirdImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height / 2).isActive = true
            thirdImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width / 2).isActive = true
            thirdImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            thirdImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            thirdImageView.translatesAutoresizingMaskIntoConstraints = false
            
            firthImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            firthImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width / 2).isActive = true
            firthImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            firthImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -self.bounds.height / 2).isActive = true
            firthImageView.translatesAutoresizingMaskIntoConstraints = false
            
            moreView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height / 2).isActive = true
            moreView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width / 2).isActive = true
            moreView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            moreView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            moreView.translatesAutoresizingMaskIntoConstraints = false
            moreView.backgroundColor = .gray
            moreView.alpha = 0.8
            
            moreLabel.text = "+ \(arrayOfPics.count - 4)"
            moreLabel.centerXAnchor.constraint(equalTo: moreView.centerXAnchor).isActive = true
            moreLabel.centerYAnchor.constraint(equalTo: moreView.centerYAnchor).isActive = true
            moreLabel.translatesAutoresizingMaskIntoConstraints = false
        default:
            break
        }
    }
}


















//                for index in arrayOfPics {
//                    if let element = index {
//                        if arrayOfPics.count > 1 {
//                            let imageView = UIImageView(image: UIImage(named: element))
//                            imageView.frame = CGRect(x: picX, y: picY, width: picWidth, height: picHeight)
//                            addSubview(imageView)
//                            picX = picX + picWidth
//                            if picX > Int(bounds.width) {
//                                picX = 0
//                                picY = picHeight + picY + 10
//                            }
//                        }
//                        else {
//                            let imageView = UIImageView(image: UIImage(named: element))
//                            imageView.frame = CGRect(x: picX, y: picY, width: Int(bounds.width), height: Int(bounds.height))
//                            addSubview(imageView)
//                        }
//                    }
//                }
