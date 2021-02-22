//
//  NewGameModel.swift
//  iOSCare+MVVM+SnapKit
//
//  Created by JHKim on 2021/02/22.
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

struct NewGameModel: Decodable {
    var contents: [NewGameContent]
    let length: Int
    let offset: Int
    let total: Int
}
