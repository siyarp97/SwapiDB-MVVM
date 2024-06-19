//
//  ContentView.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//

import SwiftUI

struct EmpireView: View {
    
    let urlStr = URL(string: "https://swapi.dev/api/")
    @ObservedObject var categoryArray : MainPageViewModel
    
    init() {
        self.categoryArray = MainPageViewModel()
    }
    
    var body: some View {

        NavigationView{
            
                List(categoryArray.categoryArr, id:\.id){ category in

                    
                        NavigationLink{
                            FilmView()
                        } label : {
                            Text("Films >")
                                .font(.title2)
                                .fontDesign(.monospaced)
                                .foregroundColor(.yellow)
                                
                        }.listRowBackground(Color.black)
                        .listRowSeparatorTint(.yellow)
                       
                    
                        
                        
                        NavigationLink{
                            PeopleView()
                        } label : {
                            Text("People >")
                                .font(.title2)
                                .fontDesign(.monospaced)
                                .foregroundColor(.yellow)
                                
                        }
                        .listRowBackground(Color.black)
                        .listRowSeparatorTint(.yellow)
                        
                        NavigationLink{
                            PlanetsView()
                        } label : {
                            Text("Planets >")
                                .font(.title2)
                                .fontDesign(.monospaced)
                                .foregroundColor(.yellow)
                        }.listRowBackground(Color.black)
                        .listRowSeparatorTint(.yellow)
                        
                        NavigationLink{
                            SpeciesView()
                        } label : {
                            Text("Species >")
                                .font(.title2)
                                .fontDesign(.monospaced)
                                .foregroundColor(.yellow)
                        }.listRowBackground(Color.black)
                        .listRowSeparatorTint(.yellow)
                        
                        NavigationLink{
                            StarshipView()
                        } label : {
                            Text("Starships >")
                                .font(.title2)
                                .fontDesign(.monospaced)
                                .foregroundColor(.yellow)
                        }.listRowBackground(Color.black)
                        .listRowSeparatorTint(.yellow)
                        
                        NavigationLink{
                            VehicleView()
                        } label : {
                            Text("Vehicles >")
                                .font(.title2)
                                .fontDesign(.monospaced)
                                .foregroundColor(.yellow)

                }.listRowBackground(Color.black)
                .listRowSeparatorTint(.yellow)


                }.background(Color.secondary)
                .scrollContentBackground(.hidden)
            .frame(width:(UIScreen.main.bounds.width) * 0.8 ,height: (UIScreen.main.bounds.height) * 0.45)

        }
        .task { await categoryArray.downloadDatas(url: urlStr!) }

    }
}

#Preview {
    EmpireView()
}
