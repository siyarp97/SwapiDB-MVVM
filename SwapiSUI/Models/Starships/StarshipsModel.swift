//
//  StarshipsModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//

import Foundation

struct StarshipsModel : Codable, Identifiable{
    
    let id = UUID()
    let name : String
    let url : String

}
