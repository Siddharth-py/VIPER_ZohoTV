//
//  Video.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import Foundation

//struct Video: Codable {
//    let title: String
//    let thumbnailURL: String
//    let videoURL: String
//}
//
//struct Category: Codable {
//    let name: String
//    let videos: [Video]
//}



struct Video {
    let url: String
    let name: String
}

struct VideoCategory {
    let name: String
    let videos: [Video]
}


//struct UserProfile {
//    let username: String
//    let imageName: String
//}

struct SettingOption {
    let name: String
    let iconName: String
}

struct HelpOption {
    let name: String
    let iconName: String
}
