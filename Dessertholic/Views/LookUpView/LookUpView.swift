//
//  LookupView.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/15/23.
//

import SwiftUI

struct LookupView: View {
    let dessertID : String
    @State var showingDetail : Bool = false
    @StateObject var lookUpViewModel = LookUpViewModel()
    
    var body: some View {
        VStack {
            ScrollView{
                ForEach(lookUpViewModel.dessertDetailsArray, id: \.self){ dessert in
                    AsyncImage(url: URL(string: dessert.strMealThumb)) {
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
                    Text("---Ingredients---")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .italic()
                        .padding([.top, .leading, .trailing])
                    ForEach(dessert.getPresentIngredients(), id: \.self) { item in
                        RowView(ingredient: item)
                    }
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
                lookUpViewModel.fetchDessertDetailsArr(dessertID: self.dessertID)
            }
        }
    }
}
