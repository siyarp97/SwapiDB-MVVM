//
//  VehiclesModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 15.06.2024.
//

import Foundation

class VehiclesModel : Codable, Identifiable{
    
    let id = UUID()
    let name : String
    let url : String
    
}
