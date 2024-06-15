//
//  DetailSpeciesViewModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 16.06.2024.
//

import Foundation

@MainActor
class DetailSpeciesViewModel : ObservableObject {
    
    @Published var speciesArray = [DetailSpeciesModel]()
    var speciesUrl = ""
    
    func downloadSpeciesData() async {
        guard let url = URL(string: speciesUrl) else {
            print("URL DÖNMEDİ SPE")
            return
        }
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            do{
                let result = try JSONDecoder().decode(DetailSpeciesModel.self, from: data)
                speciesArray.append(result)
            } catch{
                print("JSON DECODE SPE")
            }
        } catch{
            print("DATA DÖNMEDİ SPE")
        }
        
    }
}
