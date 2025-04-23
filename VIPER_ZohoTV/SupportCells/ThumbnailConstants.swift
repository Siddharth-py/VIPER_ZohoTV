//
//  ThumbnailConstants.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//


struct ThumbnailConstants {
    static let baseThumbnailURL = "https://test-backet-development.zohostratus.in"
    static let categories = ["Category1", "Category2", "Category3", "Category4", "Category5"]
    static let thumbnailCountPerCategory = 4
 
    
    
    
    
    
    static func generateThumbnails() -> [String: [String]] {
        var thumbnails: [String: [String]] = [:]
        var globalImageCounter = 1

        for category in categories {
            var categoryThumbnails: [String] = []
            for _ in 1...thumbnailCountPerCategory {
                let thumbnailURL = "\(baseThumbnailURL)/\(category)/image\(globalImageCounter).png"
                categoryThumbnails.append(thumbnailURL)
                globalImageCounter += 1
            }
            thumbnails[category] = categoryThumbnails
        }
        
        print("thumbnails \(thumbnails)")
        
        return thumbnails
    }
}
