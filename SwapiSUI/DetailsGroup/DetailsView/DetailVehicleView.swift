//
//  DetailVehicleView.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 16.06.2024.
//

import SwiftUI

struct DetailVehicleView: View {
    @ObservedObject var vehicleVM : DetailVehicleViewModel
    init(url : String){
        vehicleVM = DetailVehicleViewModel()
        vehicleVM.vehicleUrl = url
    }
    var body: some View {
        NavigationView{
            if vehicleVM.vehiclesArray.isEmpty{
                ProgressView()
                    .task { await vehicleVM.downloadVehicleData() }
            }
            else{
                List(vehicleVM.vehiclesArray){ vehicle in
                    Text(vehicle.name)
                    Text(vehicle.cargoCapacity)
                }
            }

        }
    }
}

#Preview {
    DetailVehicleView(url : "https://swapi.dev/api/vehicles/4/")
}
