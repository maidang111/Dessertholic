//
//  RowView.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/16/23.
//

import SwiftUI

struct RowView: View {
    @State var isSelected : Bool
    var ingredient : String
    var measurement : String
    var body: some View {
        HStack {
            Image(systemName: isSelected ? "square.fill" : "square")
            Text(ingredient)
            Text(measurement)
            Spacer()
        }.padding([.leading, .trailing ], 75)
            .padding([.top, .bottom], 5)
            .onTapGesture {
                if isSelected {
                    isSelected = false
                } else {
                    isSelected = true
                    
                }
            }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(isSelected : false, ingredient : "sugar", measurement : "1 cup")
    }
}
