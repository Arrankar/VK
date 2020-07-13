//
//  News.swift
//  VKapp
//
//  Created by Александр on 11.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

struct ResponseNewsData: Decodable {
    let response: NewsResponse
}

struct NewsResponse: Decodable {
    var items: [News]
    var profiles: [User]
    var groups: [Groups]
    var next_from: String
}

struct News: Decodable {
    var date: Double
    var text: String
    var source_id: Int
//    var attachments: [Attachments]
    var comments: Comments
    var likes: Likes
    var reposts: Reposts
    var views: Views
}

struct Comments: Decodable {
    var count: Int
}

struct Reposts: Decodable {
    var count: Int
}

struct Views: Decodable {
    var count: Int
}

struct Likes: Decodable {
    var count: Int
}

//struct Attachments: Decodable {
//    var type: String
//    var photo: AttachmentPhotos?
//
//    enum CodingKeys: String, CodingKey {
//        case type
//        case photo
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        type = try container.decode(String.self, forKey: .type)
//        photo = try? container.decodeIfPresent(AttachmentPhotos.self, forKey: .photo)
//    }
//}
//
//struct AttachmentPhotos: Decodable {
//    var photo_1280: String
//    var height: Int
//    var width: Int
//}

struct Groups: Decodable {
    var id: Int
    var name: String
}
