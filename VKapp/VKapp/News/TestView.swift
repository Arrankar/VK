//
//  TestView.swift
//  VKapp
//
//  Created by Александр on 11.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class TestView: UIViewController {
    
   let layer = CAShapeLayer()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(false)
       
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 28.3*3, y: 31.35*3))
        bezierPath.addLine(to: CGPoint(x: 29.809*3, y: 30.283*3))
        bezierPath.addLine(to: CGPoint(x: 31.66*3, y: 29.694*3))
        bezierPath.addLine(to: CGPoint(x: 32.85*3, y: 29.616*3))
        bezierPath.addLine(to: CGPoint(x: 34.311*3, y: 29.622*3))
        bezierPath.addLine(to: CGPoint(x: 34.702*3, y: 30.24*3))
        bezierPath.addLine(to: CGPoint(x: 35.22*3, y: 28.702*3))
        bezierPath.addLine(to: CGPoint(x: 35.647*3, y: 27.652*3))
        bezierPath.addLine(to: CGPoint(x: 36.633*3, y: 26.377*3))
        bezierPath.addLine(to: CGPoint(x: 37.633*3, y: 25.574*3))
        bezierPath.addLine(to: CGPoint(x: 38.794*3, y: 24.886*3))
        bezierPath.addLine(to: CGPoint(x: 39.91*3, y: 24.557*3))
        bezierPath.addLine(to: CGPoint(x: 41.838*3, y: 24.393*3))
        bezierPath.addLine(to: CGPoint(x: 42.977*3, y: 24.514*3))
        bezierPath.addLine(to: CGPoint(x: 44.204*3, y: 24.892*3))
        bezierPath.addLine(to: CGPoint(x: 45.229*3, y: 25.5*3))
        bezierPath.addLine(to: CGPoint(x: 48.902*3, y: 23.498*3))
        bezierPath.addLine(to: CGPoint(x: 49.768*3, y: 22.198*3))
        bezierPath.addLine(to: CGPoint(x: 50.988*3, y: 20.66*3))
        bezierPath.addLine(to: CGPoint(x: 52.612*3, y: 19.178*3))
        bezierPath.addLine(to: CGPoint(x: 54.708*3, y: 17.845*3))
        bezierPath.addLine(to: CGPoint(x: 56.889*3, y: 16.766*3))
        bezierPath.addLine(to: CGPoint(x: 59.092*3, y: 16.205*3))
        bezierPath.addLine(to: CGPoint(x: 61.206*3, y: 15.78*3))
        bezierPath.addLine(to: CGPoint(x: 63.82*3, y: 15.814*3))
        bezierPath.addLine(to: CGPoint(x: 66.971*3, y: 16.443*3))
        bezierPath.addLine(to: CGPoint(x: 69.195*3, y: 17.333*3))
        bezierPath.addLine(to: CGPoint(x: 70.956*3, y: 18.342*3))
        bezierPath.addLine(to: CGPoint(x: 72.873*3, y: 19.835*3))
        bezierPath.addLine(to: CGPoint(x: 74.662*3, y: 21.913*3))
        bezierPath.addLine(to: CGPoint(x: 75.866*3, y: 23.634*3))
        bezierPath.addLine(to: CGPoint(x: 76.847*3, y: 25.848*3))
        bezierPath.addLine(to: CGPoint(x: 77.659*3, y: 28.227*3))
        bezierPath.addLine(to: CGPoint(x: 77.912*3, y: 29.57*3))
        bezierPath.addLine(to: CGPoint(x: 78.012*3, y: 31.469*3))
        bezierPath.addLine(to: CGPoint(x: 81.13*3, y: 29.496*3))
        bezierPath.addLine(to: CGPoint(x: 82.058*3, y: 29.39*3))
        bezierPath.addLine(to: CGPoint(x: 83.389*3, y: 29.607*3))
        bezierPath.addLine(to: CGPoint(x: 85.036*3, y: 30.087*3))
        bezierPath.addLine(to: CGPoint(x: 86.522*3, y: 30.919*3))
        bezierPath.addLine(to: CGPoint(x: 87.99*3, y: 31.714*3))
        bezierPath.addLine(to: CGPoint(x: 89.272*3, y: 32.688*3))
        bezierPath.addLine(to: CGPoint(x: 90.44*3, y: 33.926*3))
        bezierPath.addLine(to: CGPoint(x: 91.333*3, y: 35.334*3))
        bezierPath.addLine(to: CGPoint(x: 92.084*3, y: 37.07*3))
        bezierPath.addLine(to: CGPoint(x: 92.656*3, y: 38.815*3))
        bezierPath.addLine(to: CGPoint(x: 92.783*3, y: 40.272*3))
        bezierPath.addLine(to: CGPoint(x: 92.678*3, y: 42.647*3))
        bezierPath.addLine(to: CGPoint(x: 92.261*3, y: 44.755*3))
        bezierPath.addLine(to: CGPoint(x: 91.132*3, y: 47.311*3))
        bezierPath.addLine(to: CGPoint(x: 89.469*3, y: 49.187*3))
        bezierPath.addLine(to: CGPoint(x: 87.331*3, y: 51.141*3))
        bezierPath.addLine(to: CGPoint(x: 85.474*3, y: 52.201*3))
        bezierPath.addLine(to: CGPoint(x: 83.059*3, y: 52.848*3))
        bezierPath.addLine(to: CGPoint(x: 32.349*3, y: 52.824*3))
        bezierPath.addLine(to: CGPoint(x: 30.47*3, y: 52.557*3))
        bezierPath.addLine(to: CGPoint(x: 28.655*3, y: 51.402*3))
        bezierPath.addLine(to: CGPoint(x: 26.764*3, y: 49.952*3))
        bezierPath.addLine(to: CGPoint(x: 25.757*3, y: 49.004*3))
        bezierPath.addLine(to: CGPoint(x: 24.489*3, y: 47.523*3))
        bezierPath.addLine(to: CGPoint(x: 23.655*3, y: 45.569*3))
        bezierPath.addLine(to: CGPoint(x: 22.987*3, y: 43.05*3))
        bezierPath.addLine(to: CGPoint(x: 22.731*3, y: 40.498*3))
        bezierPath.addLine(to: CGPoint(x: 23.255*3, y: 37.845*3))
        bezierPath.addLine(to: CGPoint(x: 24.414*3, y: 35.408*3))
        bezierPath.addLine(to: CGPoint(x: 25.842*3, y: 33.717*3))
        bezierPath.addLine(to: CGPoint(x: 28.35*3, y: 31.35*3))
        bezierPath.close()

        layer.path = bezierPath.cgPath
        layer.strokeColor = UIColor.red.cgColor
        layer.fillColor = UIColor.white.cgColor
        layer.lineWidth = 10
        layer.lineCap = .round
        layer.position.x = 50
        layer.position.y = 100



        view.layer.addSublayer(layer)

        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.fromValue = 0
        strokeStartAnimation.toValue = 1
        strokeStartAnimation.beginTime = 0.2

        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0
        strokeEndAnimation.toValue = 1
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 2
        animationGroup.repeatCount = 2
        animationGroup.animations = [strokeStartAnimation, strokeEndAnimation]
        
        layer.add(animationGroup, forKey: nil)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 3, execute: {
            self.performSegue(withIdentifier: "animationComplete", sender: self)
        })
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        


        
       
        
    }

    
//        var arrayOfPics = [String?]()
    //    var picX = 0
    //    var picY = 0
    //    let picWidth = 200
    //    let picHeight = 200
    
    
//        override func layoutSubviews() {
    //        super.layoutSubviews()
    //
    //        for index in arrayOfPics {
    //            if let element = index {
    //                if arrayOfPics.count > 1 {
    //                    let imageView = UIImageView(image: UIImage(named: element))
    //                    imageView.frame = CGRect(x: picX, y: picY, width: picWidth, height: picHeight)
    //                    addSubview(imageView)
    //                    picX = picX + picWidth
    //                    if picX > Int(bounds.width) {
    //                        picX = 0
    //                        picY = picHeight + picY + 10
    //                    }
    //                }
    //                else {
    //                    let imageView = UIImageView(image: UIImage(named: element))
    //                    imageView.frame = CGRect(x: picX, y: picY, width: Int(bounds.width), height: Int(bounds.height))
    //                    addSubview(imageView)
    //                }
    //            }
    //        }
    //    }
}

