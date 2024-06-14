//
//  SpeciesViewModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//

import Foundation

@MainActor
class SpeciesViewModel : ObservableObject {
    
    struct Returned : Codable{
        var next : String?
        var results : [SpeciesModel]
    }
    @Published var speciesArray = [SpeciesModel]()
    
    var urlString = "https://swapi.dev/api/species/"
    
    func downloadSpeciesDataAsync() async {
        
        guard let url = URL(string: urlString) else{
            print("! URL STRİNGE DÖNMEDİ SVM")
            return
        }
        
        do{
            var (data,_) = try await URLSession.shared.data(from: url)

            
            do{
                let result = try JSONDecoder().decode(Returned.self, from: data)
                urlString = result.next ?? ""
                speciesArray += result.results
                
            } catch{
                print("! JSON'a dönmedi SVM \(error.localizedDescription)")
            }
        }
        catch{
            print("! Veri Çekilemedi SVM")
        }
        
    }
    
    func loadIfNeeded(species: SpeciesModel) async {
        guard let lastSpecies = speciesArray.last else { return }
        
        if lastSpecies.id == species.id && urlString != "" {
            await downloadSpeciesDataAsync()
        }
    }
    
}
