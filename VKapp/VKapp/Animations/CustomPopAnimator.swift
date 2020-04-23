//
//  CustomPopAnimator.swift
//  VKapp
//
//  Created by Александр on 21.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

final class CustomPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.5
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
        destination.view.frame = source.view.frame
        
        let rotation = CGAffineTransform(rotationAngle: 45)
        let translation = CGAffineTransform(translationX: -source.view.frame.width, y: 0)
        destination.view.transform = rotation.concatenating(translation)
        
        UIView.animateKeyframes(
            withDuration: duration,
            delay: 0,
            options: .calculationModePaced,
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.5,
                    animations: {
                        let rotation = CGAffineTransform(rotationAngle: -45)
                        let translation = CGAffineTransform(translationX: source.view.frame.width, y: 0)
                        source.view.transform = rotation.concatenating(translation)
                })
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0.5,
                    relativeDuration: 0.5,
                    animations: {
                        destination.view.transform = .identity
                })
                
                
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.removeFromParent()
            } else if transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
    
}
