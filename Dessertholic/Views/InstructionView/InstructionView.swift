//
//  InstructionView.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/16/23.
//

import SwiftUI

struct InstructionView: View {
    let dessert : DessertDetail
    var body: some View {
        VStack {
            Image("wiskandbowl")
                .padding(.top)
            Text("---Instruction---")
                .multilineTextAlignment(.center)
                .font(.title)
                .italic()
                .padding()
            Text(dessert.strInstructions)
                .padding()
        }
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView(dessert: expectedDessertDetail)
    }
}

