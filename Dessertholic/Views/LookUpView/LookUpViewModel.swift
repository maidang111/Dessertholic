//
//  LookUpViewModel.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/20/23.
//

import Foundation

final class LookUpViewModel : ObservableObject {
    //stores DessertDetail fetchedfrom NetworkManager using dessertID
    @Published var dessertDetailsArray : [DessertDetail] = []
    @Published private(set) var isLoading : Bool = false
    
    func fetchDessertDetailsArr(dessertID : String) {
        isLoading = true
        NetworkManager.shared.fetchDessertInfo(dessertID: dessertID, onSuccess: { status , dessertDetail in
            switch status {
            case status :
                self.dessertDetailsArray = dessertDetail
            default : print("couldn't fetch dessertDetailsArray")
                
            }
        })
        isLoading = false
    }
}

