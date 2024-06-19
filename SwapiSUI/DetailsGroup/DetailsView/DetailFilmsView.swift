//
//  DetailFilmsView.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 16.06.2024.
//

import SwiftUI

struct DetailFilmsView: View {
    
    @ObservedObject var filmsVM : DetailFilmsViewModel
    @ObservedObject var personLink = PeopleViewModel()
    
    
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
                    Text(film.openingCrawl)
                    Text(film.releaseDate)
                    Text("\(film.episodeID)")
                   
                    ForEach(film.characters, id : \.self){ char in
                        ForEach(personLink.peopleArray){ person in
                            if person.url == char {
                                NavigationLink(destination: DetailPeopleView(url: char)) {
                                    Text(person.name)
                                }
                            }
                        }
                    }
                    
                    
                    
                    
                }
                .task { await personLink.downloadPeopleData() }
            }

        }
    }
}
#Preview {
    DetailFilmsView(url: "https://swapi.dev/api/films/1/")
}
