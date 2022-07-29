//
//  Stories.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 27/07/22.
//

import Foundation

struct Stories: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    let story: String
}
