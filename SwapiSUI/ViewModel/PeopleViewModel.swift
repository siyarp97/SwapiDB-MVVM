//
//  PeopleViewModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//

import Foundation

@MainActor
class PeopleViewModel : ObservableObject {
    
    var urlStr = "https://swapi.dev/api/people/"
    
    struct Returned : Codable{
        var next : String?
        var results : [PeopleModel]
    }
    
    @Published var peopleArray = [PeopleModel]()
    
    func downloadPeopleData() async{
        guard let url = URL(string: urlStr) else {
            print("! Url stringe çevrilemedi")
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)

            do{
                let returned = try JSONDecoder().decode(Returned.self, from: data)

                urlStr = returned.next ?? ""
                peopleArray += returned.results
            }
            catch{
                print("! JSON ERROR : JSON'a veriyi çeviremedim. \(error.localizedDescription)")
            }
        }
        catch{
            print("! Url'den veri gelmedi")
        }
        
    }
    
    func loadDataIfNeeded(people: PeopleModel) async {
        
        guard let lastPeople = peopleArray.last else { return }
        
        if lastPeople.id == people.id && urlStr != "" {
            await downloadPeopleData()
        }
        
    }
    
}
