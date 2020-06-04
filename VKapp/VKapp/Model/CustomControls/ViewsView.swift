//
//  ViewsView.swift
//  VKapp
//
//  Created by Александр on 25.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ViewsView: UIView {


   var stackView: UIStackView!

   var button = UIButton()
   var label = UILabel()
   
   override init(frame: CGRect) {
       super.init(frame: frame)
       self.setupView()
   }
   
   required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       self.setupView()
   }
   
   private func setupView() {
       button.addTarget(self, action: #selector(like(_:)), for: .touchUpInside)
       button.setImage(UIImage(systemName: "eye"), for: .normal)
       stackView = UIStackView(arrangedSubviews: [button, label])
       
       self.addSubview(stackView)
       
       stackView.spacing = 5
      
       stackView.heightAnchor.constraint(equalToConstant: self.bounds.height).isActive = true
       
       stackView.axis = .horizontal
       stackView.alignment = .center
       stackView.distribution = .fillProportionally
       stackView.translatesAutoresizingMaskIntoConstraints = false
   }
   
   @objc private func like(_ sender: UIButton) {
       
   }
   override func layoutSubviews() {
       super.layoutSubviews()
       stackView.frame = bounds
   }
}
