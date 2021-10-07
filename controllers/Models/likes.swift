//
//  likes.swift
//  vk_server
//
//  Created by Grisha Pospelov on 07.10.2021.
//

import Foundation

// MARK: - Likes
struct Likes: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let likes: Int
}
