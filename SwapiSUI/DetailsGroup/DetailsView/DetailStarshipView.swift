//
//  DetailStarshipView.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 16.06.2024.
//

import Foundation
import SwiftUI

struct DetailStarshipView: View {
    
    @ObservedObject var starshipVM : DetailStarshipViewModel
    
    init(url : String) {
        starshipVM = DetailStarshipViewModel()
        starshipVM.starshipUrl = url
    }
    var body: some View {
        NavigationView{
            if starshipVM.starshipArray.isEmpty{
                ProgressView()
                    .task { await starshipVM.downloadStarshipAsync() }
            }
            else{
                List(starshipVM.starshipArray) { starship in
                    Text(starship.name)
                    Text(starship.maxAtmospheringSpeed)
                }
            }
           
        }
    }
}

#Preview {
    DetailSpeciesView(url: "https://swapi.dev/api/starships/2/")
}
