//
//  News.swift
//  VKapp
//
//  Created by Александр on 11.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

struct NewsResponse: Decodable {
    let response: Response


struct Response: Decodable {
    let items: [News]
}

 class News: Decodable {
     var date = 0.0
     var text = ""
     var sourceId = 0
     var commentsCount = 0
     var likesCount = 0
     var repostsCount = 0
     var viewsCount = 0
     var image = ""
    
    enum ItemsKeys: String, CodingKey {
        case date
        case sourceId = "source_id"
        case text
        case attachments
        case comments
        case likes
        case reposts
        case views
    }
    
    enum AttachmentsKeys: String, CodingKey {
        case photo
    }

    enum PhotoKeys: String, CodingKey {
        case image = "photo_604"
    }

    enum CommentsKeys: String, CodingKey {
        case count
    }

    enum LikesKeys: String, CodingKey {
        case count
    }

    enum RepostsKeys: String, CodingKey {
        case count
    }

    enum ViewsKeys: String, CodingKey {
        case count
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let values = try decoder.container(keyedBy: ItemsKeys.self)
        self.date = try values.decode(Double.self, forKey: .date)
        self.text = try values.decode(String.self, forKey: .text)
        self.sourceId = try values.decode(Int.self, forKey: .sourceId)
        
//        var attachmentsValues = try values.nestedUnkeyedContainer(forKey: .attachments)
//        let firstAttachmentValue = try attachmentsValues.nestedContainer(keyedBy: AttachmentsKeys.self)
//        let photoValues = try firstAttachmentValue.nestedContainer(keyedBy: PhotoKeys.self, forKey: .photo)
//        self.image = try photoValues.decode(String.self, forKey: .image)
//        
//        let commentsValues = try values.nestedContainer(keyedBy: CommentsKeys.self, forKey: .comments)
//        self.commentsCount = try commentsValues.decode(Int.self, forKey: .count)
//        
//        let likesValues = try values.nestedContainer(keyedBy: LikesKeys.self, forKey: .likes)
//        self.likesCount = try likesValues.decode(Int.self, forKey: .count)
//        
//        let repostsValues = try values.nestedContainer(keyedBy: RepostsKeys.self, forKey: .reposts)
//        self.repostsCount = try repostsValues.decode(Int.self, forKey: .count)
//        
//        let viewsVAlues = try values.nestedContainer(keyedBy: ViewsKeys.self, forKey: .views)
//        self.viewsCount = try viewsVAlues.decode(Int.self, forKey: .count)
        }
    }
}
