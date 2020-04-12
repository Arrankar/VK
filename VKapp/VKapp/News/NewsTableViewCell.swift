//
//  NewsTableViewCell.swift
//  VKapp
//
//  Created by Александр on 11.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsTestView: TestView!
    @IBOutlet weak var newsSourseLabel: UILabel!
    @IBOutlet weak var newsSourseImage: AvatarView!
    @IBOutlet weak var newsDateLabel: UILabel!
    
    @IBOutlet weak var newsTextLabel: UILabel!
    
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
