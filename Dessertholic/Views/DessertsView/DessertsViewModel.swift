//
//  DessertsViewModel.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/20/23.
//

import Foundation

final class DessertViewModel : ObservableObject {
    // This stores DessertItem fetched from NetworkManager
    @Published var dessertItemArr : [DessertItem] = []
    @Published private(set) var isLoading : Bool = false
    
    func fetchDessertItemsArr() {
        isLoading = true
        NetworkManager.shared.fetchDessertItemsArr { status, dessertItem in
            if status {
                self.dessertItemArr = dessertItem
                print(self.dessertItemArr)
            } else {
                print("couldn't fetch dessertItemArray")
            }
        }
        isLoading = false
    }
}

