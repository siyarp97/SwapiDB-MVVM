//
//  DetailPeopleView.swift
//  SwapiSUI
//
//  Created by Şiyar Palabıyık on 15.06.2024.
//

import SwiftUI

struct DetailPeopleView: View {
    

    @ObservedObject var personVM : DetailPeopleViewModel

    
    init(url: String){
        personVM = DetailPeopleViewModel()
        personVM.detailUrl = url
    }
    
    var body: some View {
        if personVM.personAttributes.isEmpty{
            Text("Loading..")
                .task {
                    await personVM.downloadDetailPersonAsync()
                    }
        }
        else{
            List(personVM.personAttributes){ attr in
            Text(attr.name)
            Text(attr.birthYear)
        }
            
        }
    }
}

#Preview {
    DetailPeopleView(url: "https://swapi.dev/api/people/1/")
}
