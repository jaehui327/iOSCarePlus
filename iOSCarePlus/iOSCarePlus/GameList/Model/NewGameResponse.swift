//
//  NewGameResponse.swift
//  iOSCarePlus
//
//  Created by JHKim on 2021/01/06.
//

import Foundation

struct NewGameContent: Decodable {
    let formalName: String
    let heroBannerURL: String
    
    enum CodingKeys: String, CodingKey {
        case formalName = "formal_name"
        case heroBannerURL = "hero_banner_url"
    }
}

struct NewGameResponse: Decodable {
    var contents: [NewGameContent]
    let length: Int
    let offset: Int
    let total: Int
}
