//
//  DessertsView.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/15/23.
//

import SwiftUI

struct DessertsView: View {
    @StateObject var DessertData = APIManager()
    var body: some View {
        NavigationView{
            ScrollView {
                ForEach(DessertData.Desserts, id: \.self){ dessert in
                    NavigationLink {
                        LookupView(dessertItem: dessert)
                            .navigationTitle(dessert.strMeal)
                            .navigationBarTitleDisplayMode(.inline)
                        
                    } label: {
                        DessertDetailButton(dessertItem: dessert)
                        }
                    }

                }.onAppear{
                    DessertData.fetchDesserts()
            }
            .navigationTitle("Desserts")
        }
    }
}

struct DessertsView_Previews: PreviewProvider {
    static var previews: some View {
        DessertsView()
    }
}
