//
//  likeControl.swift
//  VKapp
//
//  Created by Александр on 04.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class LikeButton: UIView {

    var stackView: UIStackView!
    var button = UIButton()
    var label = UILabel()
    var isPressed = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
//        button.addTarget(self, action: #selector(like(_:)), for: .touchUpInside)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        
        stackView = UIStackView(arrangedSubviews: [button, label])
        
        self.addSubview(stackView)
        
        stackView.spacing = 5
        stackView.widthAnchor.constraint(equalToConstant: self.bounds.width).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: self.bounds.height).isActive = true
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
//    @objc private func like(_ sender: UIButton) {
//        if  isPressed {
//            likeCount -= 1
//            UIView.transition(with: label,
//                              duration: 0.5,
//                              options: .transitionCurlUp,
//                              animations: {
//                                self.label.text = "\(self.likeCount)"
//            })
//            button.setImage(UIImage(systemName: "heart"), for: .normal)
//            isPressed = false
//        } else {
//        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//        likeCount += 1
//            UIView.transition(with: label,
//                              duration: 0.5,
//                              options: .transitionFlipFromTop,
//                              animations: {
//                                self.label.text = "\(self.likeCount)"
//            })
//        isPressed = true
//    }

    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
}

