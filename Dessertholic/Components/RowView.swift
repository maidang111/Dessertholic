//
//  RowView.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/16/23.
//

import SwiftUI

struct RowView: View {
    @State var ingredient : Ingredient
    
    init(ingredient : Ingredient) {
        self.ingredient = ingredient
    }
    var body: some View {
        HStack {
            Image(systemName: ingredient.isSelected ? "square.fill" : "square")
            Text(ingredient.label)
            Text(ingredient.measurement)
            Spacer()
        }.padding([.leading, .trailing ], 75)
            .padding([.top, .bottom], 5)
            .onTapGesture {
                if ingredient.isSelected {
                    ingredient.isSelected = false
                } else {
                    ingredient.isSelected = true
                }
            }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(ingredient: Ingredient(label: "sugar", measurement: "1 cup", isSelected: false))
    }
}
