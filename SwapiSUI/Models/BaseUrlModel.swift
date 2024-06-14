//
//  BaseUrlModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//

import Foundation

class BaseUrlModel :  Codable, Identifiable{
    
    
    let id = UUID()
    
    let films, people, planets, species: String
    let starships, vehicles: String
    


}

