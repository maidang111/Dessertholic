//
//  DessertsView.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/15/23.
//

import SwiftUI

struct DessertsView: View {
    @StateObject var dessertViewModel = DessertViewModel()
    var body: some View {
        NavigationView{
            ScrollView {
                ForEach(dessertViewModel.dessertItemArr, id: \.self){ dessert in
                    NavigationLink {
                        LookupView(dessertID: dessert.idMeal)
                            .navigationBarTitle(dessert.strMeal, displayMode: .inline)
                    } label: {
                        DessertDetailButton(dessertItem: dessert)
                    }
                }
                
            }
            .navigationTitle("Desserts")
        }.onAppear {
            dessertViewModel.fetchDessertItemsArr()
        }
    }
}

struct DessertsView_Previews: PreviewProvider {
    static var previews: some View {
        DessertsView()
    }
}

