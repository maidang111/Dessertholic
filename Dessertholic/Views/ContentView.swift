//
//  ContentView.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/15/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var DessertData = APIManager()
    var body: some View {
        DessertsView(dessertItemArr: DessertData.dessertItemArr, DessertData: self.DessertData)
            .onAppear{
                DessertData.fetchDessertItemsArr{ (status) in
                    print("got data")
                }
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

