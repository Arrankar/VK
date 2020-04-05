//
//  likeControl.swift
//  VKapp
//
//  Created by Александр on 04.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class LikeButton: UIControl {

    var stackView: UIStackView!
    var likeCount = 10
    var button = UIButton()
    var label = UILabel()
    var isPressed = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        label.textColor = .cyan
        label.text = "\(likeCount)"
        
    

        button.addTarget(self, action: #selector(like(_:)), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        
        stackView = UIStackView(arrangedSubviews: [label, button])
        
        self.addSubview(stackView)
        
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func like(_ sender: UIButton) {
        if  !isPressed {
            likeCount -= 1
            label.text = "\(likeCount)"
            button.setImage(UIImage(systemName: "heart"), for: .normal)
           isPressed = true
        } else {
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        likeCount += 1
        label.text = "\(likeCount)"
        isPressed = false
    }
}
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
}

