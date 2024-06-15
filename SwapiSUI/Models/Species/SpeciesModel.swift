//
//  SpeciesModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//

import Foundation

class SpeciesModel : Codable, Identifiable{
    let id = UUID()
    let name : String
    let url : String
}
