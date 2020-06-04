//
//  AllGroupsTableViewCell.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class AllGroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var allGroupsImage: UIImageView!
    @IBOutlet weak var allGroupsName: UILabel!
    @IBOutlet weak var membersLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        allGroupsImage.layer.cornerRadius = 50
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
