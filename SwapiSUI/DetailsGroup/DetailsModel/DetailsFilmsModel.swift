//
//  DetailsFilmsModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 16.06.2024.
//

import Foundation

class DetailsFilmsModel: Codable, Identifiable {
    
    let id = UUID()
    let title: String
    let episodeID: Int
    let openingCrawl, director, producer, releaseDate, url: String
    let characters : [String]
    
    enum CodingKeys: String, CodingKey {
        case title
        case episodeID = "episode_id"
        case openingCrawl = "opening_crawl"
        case director, producer
        case releaseDate = "release_date"
        case url
        case characters
        }
}



