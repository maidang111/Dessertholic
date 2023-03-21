//
//  DessertsViewModel.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/20/23.
//

import Foundation

final class DessertViewModel : ObservableObject {
    //stores DessertItem fetchedfrom NetworkManager
    @Published var dessertItemArr : [DessertItem] = []
    @Published private(set) var isLoading : Bool = false
    
    func fetchDessertItemsArr() {
        isLoading = true
        NetworkManager.shared.fetchDessertItemsArr { status, dessertItem in
            switch status {
            case status :
                self.dessertItemArr = dessertItem
                print(self.dessertItemArr)
            default : print("couldn't fetch dessertItemArray")
            }
        }
        isLoading = false
    }
}
