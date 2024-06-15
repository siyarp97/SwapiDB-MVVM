//
//  DetailSpeciesView.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 16.06.2024.
//

import SwiftUI

struct DetailSpeciesView: View {
    
    @ObservedObject var speciesVM : DetailSpeciesViewModel
    init(url : String) {
        speciesVM = DetailSpeciesViewModel()
        speciesVM.speciesUrl = url
    }
    var body: some View {
        NavigationView{
                if(speciesVM.speciesArray.isEmpty){
                    ProgressView()
                        .task { await speciesVM.downloadSpeciesData()}
                }
                else{
                    List(speciesVM.speciesArray) { specie in
                        Text(specie.name)
                        Text(specie.language)
                    }
                }
        }
    }
}

#Preview {
    DetailSpeciesView(url: "https://swapi.dev/api/species/1")
}
