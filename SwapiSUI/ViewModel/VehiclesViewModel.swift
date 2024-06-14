//
//  VehiclesViewModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 15.06.2024.
//

import Foundation

@MainActor
class VehiclesViewModel : ObservableObject {
    
    @Published var vehiclesArray = [VehiclesModel]()
    
    struct Returned : Codable{
        var next : String?
        var results : [VehiclesModel]
    }
    
    var urlString = "https://swapi.dev/api/vehicles/"
    
    func downloadVehiclesDataAsync() async {
        guard let url = URL(string: urlString) else{
            print("URL DÖNMED VVM")
            return
        }
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            do {
                let result = try JSONDecoder().decode(Returned.self, from: data)
                urlString = result.next ?? ""
                vehiclesArray += result.results
            }
            catch{
                print("JSON PARSE ERROR!")
            }
        }catch{
            print("Veri Gelmedi!")
        }
    }
    func downloadIfNeeded(vehicle: VehiclesModel) async{
        guard let lastVehicle = vehiclesArray.last else { return }
        if lastVehicle.id == vehicle.id && urlString != ""{
            await downloadVehiclesDataAsync()
        }
    }
}
