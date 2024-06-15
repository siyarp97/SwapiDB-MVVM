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
        
    NavigationStack{
        VStack{
            List(peopleVM.peopleArray, id : \.id) { people in
                NavigationLink(destination: DetailPeopleView(url: people.url), label: {
                    Text(people.name)
                })
                .task{ await peopleVM.loadDataIfNeeded(people: people) }
            }
        }.task { await peopleVM.downloadPeopleData() }
    }
}
    
#Preview {
    PeopleView()
    }
}


