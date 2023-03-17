//
//  LookupView.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/15/23.
//

import SwiftUI

struct LookupView: View {
    @State var showingDetail : Bool = false
    @StateObject var DessertData = APIManager()
    var dessertItem : dessert
    var body: some View {
        VStack {
            ScrollView{
                AsyncImage(url: URL(string: dessertItem.strMealThumb)) {
                    image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .cornerRadius(10)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .cornerRadius(10)
                }
                ForEach(DessertData.Details, id: \.self){ dessert in
                    Text("---Ingredients---")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .italic()
                        .padding([.top, .leading, .trailing])
                    RowView(isSelected: false, ingredient: "Milk", measurement: "200ml")
                    RowView(isSelected: false, ingredient: "Oil", measurement: "60ml")
                    RowView(isSelected: false, ingredient: "Eggs", measurement: "2")
                    RowView(isSelected: false, ingredient: "Flour", measurement: "1600g")
                    RowView(isSelected: false, ingredient: "Baking Powder", measurement: "3 tsp")
                    Text("------------------")
                        .padding(.top)
                        .font(.title)
                    Button{
                        self.showingDetail.toggle()
                    } label: {
                        Text("Instructions")
                    }.foregroundColor(.white)
                        .padding([.trailing, .leading], 15)
                        .padding([.top, .bottom], 10)
                        .background (.gray)
                        .cornerRadius(10)
                        .sheet(isPresented: $showingDetail) {
                            InstructionView(dessert : dessert)
                                }
                    }
            }
            .onAppear{
                DessertData.fetchDessertInfo(dessertID: dessertItem.idMeal)
        }
        }
    }
}
