import Foundation
import SwiftUI
import MapKit

struct Exhibition: Identifiable, Equatable {
    // MARK: - 核心属性
    let id = UUID()
    var galleryName: String
    var address: String
    var artistName: String
    var exhibitionTitle: String
    var imageURLs: [String]
    var externalLink: String
    var isFeatured: Bool
    var isLive: Bool
    var isFavorite: Bool
    let coordinate: Coordinate
    let pressRelease: String
    
    // MARK: - 坐标结构体
    struct Coordinate: Equatable {
        var latitude: Double
        var longitude: Double
    }
    
    // MARK: - 地图标记颜色
    var pinColor: Color {
        if isFavorite { return .red }
        return isFeatured ? .blue : .green
    }
}

// MARK: - 示例数据
extension Exhibition {
    static let sampleData = [
        Exhibition(
            galleryName: "Petzel Gallery",
            address: "520 W 25th St, New York, NY 10001",
            artistName: "Nicola Tyson",
            exhibitionTitle: "I am a teapot",
            imageURLs: ["exhibition1", "exhibition2", "exhibition3"],
            externalLink: "https://example.com",
            isFeatured: true,
            isLive: false,
            isFavorite: false,
            coordinate: Coordinate(latitude: 40.7128, longitude: -74.0060),
            pressRelease: "Petzel is pleased to present I am a teapot..."
        ),
        Exhibition(
            galleryName: "Nicelle Beauchene Gallery",
            address: "7 Franklin Pl, New York, NY 10013",
            artistName: "Violeta Maya",
            exhibitionTitle: "Me atrevo a decir que esta pintura está viva",
            imageURLs: ["exhibition4", "exhibition5"],
            externalLink: "https://nicellebeauchene.com/",
            isFeatured: true,
            isLive: true,
            isFavorite: false,
            coordinate: Coordinate(latitude: 40.7194, longitude: -74.0031),
            pressRelease: "Nicelle Beauchene Gallery is pleased to present..."
        )
    ]
}
