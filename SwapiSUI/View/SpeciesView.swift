//
//  SwiftUIView.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//

import SwiftUI

struct SpeciesView: View {
    
    @ObservedObject var speciesVM : SpeciesViewModel
    
    init() {
        speciesVM = SpeciesViewModel()
    }
    
    var body: some View {
        
        NavigationView{
            List(speciesVM.speciesArray){ specie in
                NavigationLink(destination: {
                    DetailSpeciesView(url: specie.url)
                }, label: {
                    Text(specie.name)
                })
                    .task {
                        await speciesVM.loadIfNeeded(species: specie)
                    }
            }
        }.task {
           await speciesVM.downloadSpeciesDataAsync()
        }
        
    }
}

#Preview {
    SpeciesView()
}
