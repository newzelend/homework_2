//
//  group.swift
//  vk_server
//
//  Created by Grisha Pospelov on 07.10.2021.
//

import Foundation

// MARK: - Main
struct Groups: Codable {
    let response: GroupResponse
}

// MARK: - Response
struct GroupResponse: Codable {
    let count: Int
    let items: [GroupItem]
}

// MARK: - Item
class GroupItem: Codable {
    var id: Int = 0
    var name: String = ""
    var groupDescription: String?
    var imageURL: String = ""
    var membersCount: Int = 0

    enum CodingKeys: String, CodingKey {
        case id, name
        case groupDescription = "description"
        case imageURL = "photo_100"
        case membersCount = "members_count"
    }
}
