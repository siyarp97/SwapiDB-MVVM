//
//  PlanetsView.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//

import SwiftUI

struct PlanetsView: View {
    
   @ObservedObject var planetsVM : PlanetsViewModel
    
    init() {
        planetsVM = PlanetsViewModel()
    }
    
    var body: some View {
        NavigationView{
            
            List(planetsVM.planetsArray) {planet in
                Text(planet.name)
                    .task {
                        await planetsVM.loadIfNeeded(planets: planet)
                    }
            }
        }.task {
            await planetsVM.getPlanetsData()
        }
    }
}

#Preview {
    PlanetsView()
}
