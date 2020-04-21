//
//  CustomNavigationController.swift
//  VKapp
//
//  Created by Александр on 21.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
       
    }

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return CustomPushAnimator()
        } else if operation == .pop {
            return CustomPopAnimator()
        }
        return nil
    }
}
