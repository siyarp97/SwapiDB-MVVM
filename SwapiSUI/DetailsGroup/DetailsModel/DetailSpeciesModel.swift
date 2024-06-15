//
//  DetailSpeciesModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 16.06.2024.
//

import Foundation

class DetailSpeciesModel : Codable, Identifiable {
    let id = UUID()
    let name, classification, designation, averageHeight: String
    let skinColors, hairColors, eyeColors, averageLifespan: String
    let homeworld: String
    let language: String
    
    enum CodingKeys: String, CodingKey {
        case name, classification, designation
        case averageHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case averageLifespan = "average_lifespan"
        case homeworld, language
        }
}
