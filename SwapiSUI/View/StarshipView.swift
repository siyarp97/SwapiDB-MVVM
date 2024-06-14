//
//  SwiftUIView.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 15.06.2024.
//

import SwiftUI

struct StarshipView: View {
    @ObservedObject var starshipsVM : StarshipsViewModel
    
    init() {
        starshipsVM = StarshipsViewModel()
    }
    
    var body: some View {
        
        NavigationView{
            List(starshipsVM.starshipsArray){ starship in
                Text(starship.name)
                    .task {
                        await starshipsVM.downloadIfNeeded(starship: starship)
                    }
            }
        }.task {
            await starshipsVM.downloadDataAsync()
        }
        
    }
}


#Preview {
    StarshipView()
}
