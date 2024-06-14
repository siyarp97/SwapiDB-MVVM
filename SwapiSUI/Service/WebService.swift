//
//  WebService.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//

import Foundation

class WebService {
    
    func getDataFirstStep(url: URL) async throws -> BaseUrlModel{
        
        let (data,_) = try await URLSession.shared.data(from: url)
        
        let MPlinks = try? JSONDecoder().decode(BaseUrlModel.self, from: data)
    
        return MPlinks as! BaseUrlModel
    }
    
    func getFilmsDataAsync(url: URL) async throws -> FilmsModel {
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let filmData = try? JSONDecoder().decode(FilmsModel.self, from: data)
        
        return filmData as! FilmsModel
        
    }
    

    
}

