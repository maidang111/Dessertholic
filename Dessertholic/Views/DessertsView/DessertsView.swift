//
//  DessertsView.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/15/23.
//

import SwiftUI

struct DessertsView: View {
    var dessertItemArr : [DessertItem] = []
    @StateObject var DessertData : APIManager
    var body: some View {
        NavigationView{
            ScrollView {
                ForEach(dessertItemArr, id: \.self){ dessert in
                    NavigationLink {
                        LookupView(dessertItem: dessert)
                            .navigationTitle(dessert.strMeal)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        DessertDetailButton(dessertItem: dessert)
                        }
                    }

                }
            .navigationTitle("Desserts")
        }
    }
}
