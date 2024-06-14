//
//  StarshipsViewModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//

import Foundation

@MainActor
class StarshipsViewModel : ObservableObject {
    
    @Published var starshipsArray = [StarshipsModel]()
    struct Result : Codable {
        var next : String?
        var results : [StarshipsModel]
    }
    
    var urlString = "https://swapi.dev/api/starships/"
    
    func downloadDataAsync() async {
        guard let url = URL(string: urlString) else{
            print("URL DÖNMEDİ STARSHIPS")
            return
        }
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            do{
                let result = try JSONDecoder().decode(Result.self, from: data)
                urlString = result.next ?? ""
                starshipsArray += result.results
                
            }
            catch{
                print("JSON ERROR!")
            }
        }
        catch{
            print("VERİ GELMEDİ STARSHIPS")
        }
    }
    
    func downloadIfNeeded(starship : StarshipsModel) async {
        guard let lastStarship = starshipsArray.last else { return }
        if lastStarship.id == starship.id && urlString != "" {
            await downloadDataAsync()
        }
    }
}
