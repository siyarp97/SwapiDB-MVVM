//
//  MainPageViewModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//

import Foundation

@MainActor
class MainPageViewModel : ObservableObject {
    
    @Published var categoryArr = [BaseUrlModel]()
    
    let webService = WebService()
    
    func downloadDatas(url: URL) async{
        
        do{
            let categories = try await webService.getDataFirstStep(url: url)
            categoryArr.append(categories)
        }
        
        catch{
            print("Error VM")
        }
        
    }
    
}





//class MainPageModel{
//    
//    let mainPart : BaseUrlModel
//    
//    var id : UUID?{
//        mainPart.id
//    }
//    
//    var films : String{
//        mainPart.films
//    }
//    var people : String{
//        mainPart.people
//    }
//    var planets : String{
//        mainPart.planets
//    }
//    var species : String{
//        mainPart.species
//    }
//    var starship : String{
//        mainPart.starships
//    }
//    var vehicles : String{
//        mainPart.vehicles
//    }
//    
//}
