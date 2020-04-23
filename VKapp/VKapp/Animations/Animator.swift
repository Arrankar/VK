//
//  Animator.swift
//  VKapp
//
//  Created by Александр on 21.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

final class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let duration = 0.5
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let source = transitionContext.viewController(forKey: .from)
            else { return }
        guard let destination = transitionContext.viewController(forKey: .to)
            else { return }
        
        let containerViewFrame = transitionContext.containerView.frame
        let sourceViewTargetFrame = CGRect(
            x: 0,
            y: -containerViewFrame.height,
            width: source.view.frame.width,
            height: source.view.frame.height)
        let destinationViewTargetFrame = source.view.frame
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.frame = CGRect(
            x: 0,
            y: containerViewFrame.height,
            width: source.view.frame.width,
            height: source.view.frame.height)
        
        
        UIView
            .animate(withDuration: self.transitionDuration(using: transitionContext),
                     animations: {
                        source.view.frame = sourceViewTargetFrame
                        destination.view.frame = destinationViewTargetFrame
            }) { finished in
                source.removeFromParent()
                transitionContext.completeTransition(finished)
        }
    }
    
    
}
