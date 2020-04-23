//
//  FlipAnimation.swift
//  VKapp
//
//  Created by Александр on 22.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class FlipPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let originFrame: CGRect
    private let duration = 0.5
    
    init(originFrame: CGRect) {
        self.originFrame = originFrame
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to),
            let snapshot = toVC.view.snapshotView(afterScreenUpdates: true)
            else {
                return
        }
        
        let containerView = transitionContext.containerView
        let finalFrame = transitionContext.finalFrame(for: toVC)
        
        snapshot.frame = originFrame
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot)
        toVC.view.isHidden = true
        
        UIView.animateKeyframes(
            withDuration: duration,
            delay: 0,
            options: .calculationModeCubic,
            animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0,
                                   relativeDuration: 1) {
                                    snapshot.frame = finalFrame
                                    snapshot.layer.cornerRadius = 0
                }
        },
            
            completion: { _ in
                toVC.view.isHidden = false
                snapshot.removeFromSuperview()
                fromVC.view.layer.transform = CATransform3DIdentity
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
