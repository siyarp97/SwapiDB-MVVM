//
//  DetailPlanetViewModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 16.06.2024.
//

import Foundation

@MainActor
class DetailStarshipViewModel : ObservableObject {
    @Published var starshipArray = [DetailsStarshipModel]()
    var starshipUrl = ""
    
    func downloadStarshipAsync() async {
        guard let url = URL(string: starshipUrl) else{
            print("PLANET URL !")
            return
        }
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            do{
                let result = try JSONDecoder().decode(DetailsStarshipModel.self, from: data)
                starshipArray.append(result)
            }
            catch{
                print("JSON DECODE SORUNU")
            }
        } catch{
            print("DATA GELMEDİ")
        }
        
    }
}

