//
//  DetailFilmsView.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 16.06.2024.
//

import SwiftUI

struct DetailFilmsView: View {
    
    @ObservedObject var filmsVM : DetailFilmsViewModel
    
    init(url : String){
        filmsVM = DetailFilmsViewModel()
        filmsVM.filmUrl = url
    }
    
    var body: some View {
        
        NavigationView{
            if filmsVM.filmsArray.isEmpty{
                Text("Loading...")
                    .task {
                       await filmsVM.downloadFilmDataAsync()
                    }
            } else{
                List(filmsVM.filmsArray){ film in
                    Text(film.title)
                    Text(film.producer)
                }
            }
       
        }
        
    }
}

#Preview {
    DetailFilmsView(url: "https://swapi.dev/api/films/1/")
}
