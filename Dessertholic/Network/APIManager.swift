//
//  APIManager.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/15/23.
//

import Foundation

class APIManager : ObservableObject {
    private var api = "https://themealdb.com/api/json/v1/1/"
    private var filterDessert = "filter.php?c=Dessert"
    private var loopupItem = "lookup.php?i="
    @Published var Desserts : Array<DessertItem> = []
    @Published var Details : Array<DessertDetail> = []
    
    var ingredents : Array<String> = []
    
    func fetchDessertsList() {
        guard let url = URL(string: "\(api)\(filterDessert)") else {
            print("couldn't convert to url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("\(error!)")
                return
            }
            
            var dessertlist : DessertsList?
            do {
                dessertlist = try JSONDecoder().decode(DessertsList.self, from: data)
                DispatchQueue.main.async {
                    
                    self?.Desserts = dessertlist!.meals
                        .sorted(by: { dessert1, dessert2 in
                            dessert1.strMeal < dessert2.strMeal
                        })
                }
            } catch {
                print("could not convert data to Objects")
            }
        }.resume()
    }
    
    func fetchDessertInfo(dessertID : String) {
        
        guard let url = URL(string: "\(api)\(loopupItem)\(dessertID)") else {
            print("couldn't convert to url")
            return
        }
        print(url)
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("\(error!)")
                return
            }
            
            var dessertInfo : Dessert?
            
            do {
                dessertInfo = try JSONDecoder().decode(Dessert.self, from: data)
                DispatchQueue.main.async {
                    self?.Details = dessertInfo!.meals
                    //                    print(self!.Details)
                    print("got recipe")
                }
            } catch {
                print("could not convert data to Objects")
            }
        }.resume()
        
        func getIngredientList(dessert : DessertDetail){
            
        }
    }
}
