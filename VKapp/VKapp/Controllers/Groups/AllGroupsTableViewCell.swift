//
//  AllGroupsTableViewCell.swift
//  VKapp
//
//  Created by Александр on 01.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class AllGroupsTableViewCell: UITableViewCell {

    @IBOutlet private weak var allGroupsImage: UIImageView!
    @IBOutlet private weak var allGroupsName: UILabel!
    @IBOutlet private weak var membersLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        allGroupsImage.layer.cornerRadius = 50
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with group: Group) {
        allGroupsName.text = group.groupName
        membersLabel.text = String(group.membersCount)
        guard let url = URL(string: group.image),
        let data = try? Data(contentsOf: url)
        else {
        return
        }
        allGroupsImage.image = UIImage(data: data)
    }

}
