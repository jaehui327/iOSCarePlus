//
//  NewGameResponse.swift
//  iOSCarePlus
//
//  Created by JHKim on 2021/01/06.
//

import Foundation

struct Images: Decodable {
    let url: String
}

struct ScreenShots: Decodable {
    let images: [Images]
}

struct NewGameContent: Decodable {
    let formalName: String
    let heroBannerURL: String
    let screenshots: [ScreenShots]
    
    enum CodingKeys: String, CodingKey {
        case formalName = "formal_name"
        case heroBannerURL = "hero_banner_url"
        case screenshots
    }
}

struct NewGameResponse: Decodable {
    var contents: [NewGameContent]
    let length: Int
    let offset: Int
    let total: Int
}
