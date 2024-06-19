//
//  DetailPeopleView.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 15.06.2024.
//

import SwiftUI

struct DetailPeopleView: View {
    

    @ObservedObject var personVM : DetailPeopleViewModel
    @ObservedObject var homeworldData =  PlanetsViewModel()
    
    init(url: String){
        personVM = DetailPeopleViewModel()
        personVM.detailUrl = url
    }
    
    var body: some View {
        NavigationStack{
            if personVM.personAttributes.isEmpty{
                Text("Loading..")
                    .task { await personVM.downloadDetailPersonAsync() }
            }
            else{
                List(personVM.personAttributes){ attr in
                    VStack{
                        Text("Name : \(attr.name)").fontWeight(.bold)
                        Text(attr.birthYear)
                        
                        ForEach(homeworldData.planetsArray) {planet in
                            if planet.url == attr.homeworld{
                                NavigationLink {
                                    DetailPlanetsView(url: attr.homeworld)
                                } label: {
                                    Text(planet.name)
                                }

                            }}
                    }
                    
                } .task { await homeworldData.getPlanetsData() }
            }
        }
    }
}

#Preview {
    DetailPeopleView(url: "https://swapi.dev/api/people/1/")
}
