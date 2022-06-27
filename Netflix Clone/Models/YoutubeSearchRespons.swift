//
//  YoutubeSearchRespons.swift
//  Netflix Clone
//
//  Created by Miad Jalili on 26.06.2022.
//

import Foundation


struct YoutubeSearchRespons: Codable {
  
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let kind: String
    let id: ID
}

// MARK: - ID
struct ID: Codable {
    let kind: String
    let videoID : String

    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
    }
}

