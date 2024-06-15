//
//  DetailPlanetViewModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 16.06.2024.
//

import Foundation

@MainActor
class DetailPlanetViewModel : ObservableObject {
    @Published var planetsArray = [DetailPlanetModel]()
    var planetUrl = ""
    
    func downloadPlanetsAsync() async {
        guard let url = URL(string: planetUrl) else{
            print("PLANET URL !")
            return
        }
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            do{
                let result = try JSONDecoder().decode(DetailPlanetModel.self, from: data)
                planetsArray.append(result)
            }
            catch{
                print("JSON DECODE SORUNU")
            }
        } catch{
            print("DATA GELMEDİ")
        }
        
    }
}

