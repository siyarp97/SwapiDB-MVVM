//
//  FilmView.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//

import SwiftUI

struct FilmView: View {
    
    let urlStr = URL(string:"https://swapi.dev/api/films/")
    
    @ObservedObject var filmsArr : FilmsViewModel
    
    init(){
        filmsArr = FilmsViewModel()
    }
    
    var body: some View {
        NavigationView{
            ForEach(filmsArr.filmsArray){ filmResults in
                List(filmResults.results){ filmInfo in
                    HStack{
                        Text(filmInfo.title)
                    }
                }
        }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Films")
        }.task {
           await filmsArr.downloadFilmData(url: urlStr!)
        }
    }
}

#Preview {
    FilmView()
}
