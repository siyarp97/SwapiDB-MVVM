//
//  PeopleView.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 14.06.2024.
//

import SwiftUI

struct PeopleView: View {
    
    
    
    @ObservedObject var peopleVM : PeopleViewModel
    
    init(){
        peopleVM = PeopleViewModel()
    }
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                List(peopleVM.peopleArray) { people in
                    Text(people.name)
                        .task {
                            await peopleVM.loadDataIfNeeded(people: people)
                        }
                }
            }
            
        }.task {
            await peopleVM.downloadPeopleData()
        }
        
    }
}

#Preview {
    PeopleView()
}
