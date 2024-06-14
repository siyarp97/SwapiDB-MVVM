//
//  PlanetsViewModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//


import Foundation

@MainActor
class PlanetsViewModel : ObservableObject {
    
    struct Returned : Codable{
        var next : String?
        var results : [PlanetsModel]
    }
    
    @Published var planetsArray = [PlanetsModel]()
    
    var urlString = "https://swapi.dev/api/planets/"
    
    func getPlanetsData() async {
        
        guard let url = URL(string: urlString) else {
            print("! Url stringe çevrilemedi.")
            return
        }
        
        do{
            let (data, _ ) = try await URLSession.shared.data(from: url)
            
            do{
                let result = try JSONDecoder().decode(Returned.self, from: data)

                urlString = result.next ?? ""
                planetsArray += result.results
            }
            catch{
                print("! JSON ERROR ! \(error.localizedDescription) ")
            }
            
        }
        catch{
            print("! Datayı çekemedim.")
        }
        
    }
    
    func loadIfNeeded(planets : PlanetsModel) async {
        
        guard let lastPlanet = planetsArray.last else{ return }
        
        if lastPlanet.id == planets.id && urlString != "" {
            await getPlanetsData()
        }
        
    }
    
}
