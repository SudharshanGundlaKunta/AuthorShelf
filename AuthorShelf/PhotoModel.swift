//
//  PhotoModel.swift
//  AuthorShelf
//
//  Created by Sudharshan on 05/07/24.
//

import Foundation


struct Photo: Codable {
    var id: String
    var author: String
    var width: Int
    var height: Int
    var url: String
    var download_url: String
    var isFav: Bool = false
    
    enum CodingKeys: String, CodingKey {
            case id, author, width, height, url, download_url, isFav
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            author = try container.decode(String.self, forKey: .author)
            width = try container.decode(Int.self, forKey: .width)
            height = try container.decode(Int.self, forKey: .height)
            url = try container.decode(String.self, forKey: .url)
            download_url = try container.decode(String.self, forKey: .download_url)
            isFav = try container.decodeIfPresent(Bool.self, forKey: .isFav) ?? false
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(author, forKey: .author)
            try container.encode(width, forKey: .width)
            try container.encode(height, forKey: .height)
            try container.encode(url, forKey: .url)
            try container.encode(download_url, forKey: .download_url)
            try container.encode(isFav, forKey: .isFav)
        }
}
