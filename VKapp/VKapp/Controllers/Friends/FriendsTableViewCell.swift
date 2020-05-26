//
//  FriendsTableViewCell.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendImage: AvatarView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendSurname: UILabel!
    
    let scale = CGAffineTransform(scaleX: 0.5, y: 0.5)
    let scale2 = CGAffineTransform(scaleX: 1, y: 1)

    @objc func animateImage(sender: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.friendImage.transform = self.scale
        })
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.5,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        self.friendImage.transform = self.scale2

        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.alpha = 0
        let tap = UITapGestureRecognizer(target: self, action: #selector(animateImage(sender:)))
        friendImage.addGestureRecognizer(tap)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
