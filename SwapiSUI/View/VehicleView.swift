//
//  VehicleView.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 15.06.2024.
//

import SwiftUI

struct VehicleView: View {
    @ObservedObject var vehiclesArray : VehiclesViewModel
    init() {
        self.vehiclesArray = VehiclesViewModel()
    }
    var body: some View {
        NavigationView{
            List(vehiclesArray.vehiclesArray){ vehicle in
                Text(vehicle.name)
                    .task {
                        await vehiclesArray.downloadIfNeeded(vehicle: vehicle)
                    }
            }
        }.task {
           await vehiclesArray.downloadVehiclesDataAsync()
        }
    }
}

#Preview {
    VehicleView()
}
