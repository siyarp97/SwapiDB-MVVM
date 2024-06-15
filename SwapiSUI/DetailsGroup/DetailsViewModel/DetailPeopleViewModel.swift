//
//  DetailPeopleViewModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 15.06.2024.
//

import Foundation

@MainActor
class DetailPeopleViewModel : ObservableObject {
    
    @Published var personAttributes = [DetailPeopleModel]()
    @Published var detailUrl = ""
    
    struct Result:Codable{
        var results : [DetailPeopleModel]
    }
    
    func downloadDetailPersonAsync() async{
        guard let url = URL(string: detailUrl) else {
            print("! URL DÖNMEDİ DPVM")
            return
        }
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            do{
                let result = try JSONDecoder().decode(DetailPeopleModel.self, from: data)
                personAttributes.append(result)
            } catch{
                print("JSON PARSE ERROR")
            }
        } catch{
            print("VERİ GELMEDi!")
        }
    }

}
