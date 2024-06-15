//
//  DetailPlanetsView.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 16.06.2024.
//

import SwiftUI

struct DetailPlanetsView: View {
    @ObservedObject var planetVM : DetailPlanetViewModel
    init(url : String) {
        planetVM = DetailPlanetViewModel()
        planetVM.planetUrl = url
    }
    var body: some View {
        NavigationView{
            if planetVM.planetsArray.isEmpty{
                ProgressView()
                    .task{ await planetVM.downloadPlanetsAsync() }
            }
            else{
                List(planetVM.planetsArray){ planet in
                    Text(planet.name)
                    Text(planet.climate)
                }
            }

        }
    }
}

#Preview {
    DetailPlanetsView(url: "https://swapi.dev/api/planets/1/")
}
