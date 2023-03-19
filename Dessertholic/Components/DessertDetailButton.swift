//
//  DessertDetailButton.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/15/23.
//

import SwiftUI

struct DessertDetailButton: View {
    var dessertItem : DessertItem
    var body: some View {
        ZStack{
            Rectangle()
                .shadow(radius: 5)
                .foregroundColor(.white)
            HStack{
                AsyncImage(url: URL(string: dessertItem.strMealThumb)) {
                    image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                        .padding([.leading, .top, .bottom])
                } placeholder: {
                    Image(systemName: "photo")
                }
                Spacer()
                Text(dessertItem.strMeal)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "ellipsis")
                    .padding(.trailing)
                    .foregroundColor(.black)
            }
        }
    }
}
