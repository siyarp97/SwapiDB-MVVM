//
//  FilmsViewModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//

import Foundation

@MainActor
class FilmsViewModel : ObservableObject{
   
    @Published var filmsArray = [FilmsModel]()
    
    let webService = WebService()
    
    func downloadFilmData(url: URL) async {
        
        do{
            let films = try await webService.getFilmsDataAsync(url: url)
            filmsArray.append(films)

        }
        catch{
            print("Error FVM")
        }
        
    }
    
}
