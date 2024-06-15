//
//  DetailFilmsViewModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 16.06.2024.
//

import Foundation

@MainActor
class DetailFilmsViewModel : ObservableObject{
    
    @Published var filmsArray = [DetailsFilmsModel]()
    var filmUrl = ""
    
    func downloadFilmDataAsync() async {
        
        guard let url = URL(string: filmUrl) else {
            print("! URL DÖNMEDİ FİLMS MODEL")
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            do{
                let result = try JSONDecoder().decode(DetailsFilmsModel.self, from: data)
                filmsArray.append(result)
            }
            catch{
                print("JSON DECODE FİLMS MODEL")
            }
        } catch{
            print("! DATA GELMEDİ FİLMS MODEL")
        }
        
    }
    
    
}
