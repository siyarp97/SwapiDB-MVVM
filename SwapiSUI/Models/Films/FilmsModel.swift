//
//  FilmsModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//

import Foundation

// MARK: - FilmModel
struct FilmsModel: Codable, Identifiable {
    let id = UUID()
    let results: [Result]
}

// MARK: - Result
struct Result: Codable, Identifiable {
    
    let id = UUID()
    let title: String
    let url: String

}

