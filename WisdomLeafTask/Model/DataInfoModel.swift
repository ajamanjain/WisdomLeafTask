//
//  DataInfoModel.swift
//  WisdomLeafTask
//
//  Created by Aman Jain on 15/05/23.
//

import Foundation

// MARK: - WelcomeElement
struct DataInfo: Codable {
    let id, author: String
    let width, height: Int
    let url, downloadURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}
