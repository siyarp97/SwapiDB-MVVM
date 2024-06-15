//
//  DetailPlanetModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 16.06.2024.
//

import Foundation

class DetailPlanetModel : Codable, Identifiable{
    let id = UUID()
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String

    enum CodingKeys: String, CodingKey {
            case name
            case rotationPeriod = "rotation_period"
            case orbitalPeriod = "orbital_period"
            case diameter, climate, gravity, terrain
            case surfaceWater = "surface_water"
            case population
        }
    
}
