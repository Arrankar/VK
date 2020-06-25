//
//  GroupsTableViewCell.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var groupImage: UIImageView!
    @IBOutlet private weak var groupName: UILabel!
    @IBOutlet private weak var membersCount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        groupImage.layer.cornerRadius = 50
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with group: Group) {
        groupName.text = group.groupName
        membersCount.text = String(group.membersCount)
        let url = URL(string: group.image)
        groupImage.image = UIImage(data: try! Data(contentsOf: url!))!
    }
}
