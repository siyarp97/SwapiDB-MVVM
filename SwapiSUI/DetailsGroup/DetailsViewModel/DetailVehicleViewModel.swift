//
//  DetailVehicleViewModel.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 16.06.2024.
//

import Foundation

@MainActor
class DetailVehicleViewModel : ObservableObject {
  
    @Published var vehiclesArray = [DetailVehicleModel]()
    var vehicleUrl = ""
    
    func downloadVehicleData() async {
        guard let url = URL(string: vehicleUrl) else {
            print("URL DÖNMEDİ VEH")
            return
        }
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            do{
                let result = try JSONDecoder().decode(DetailVehicleModel.self, from: data)
                vehiclesArray.append(result)
            } catch{
                print("JSON DECODE VEH")
            }
            
        }
        catch {
            print("Data gelmedi VEH")
        }
    }
}
