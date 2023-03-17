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
    @Published var Desserts : Array<dessert> = []
    @Published var Details : Array<DessertDetail> = []
    
    var ingredents : Array<String> = []
    
    func fetchDesserts() {
        // creating desired url to fetch data from API
        guard let url = URL(string: "\(api)\(filterDessert)") else {
            print("couldn't convert to url")
            return
        }
        // fetching the data using URLSession
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("\(error!)")
                return
                
            
            }
            // covert data to objects
            var dessertlist : DessertList?
            do {
                dessertlist = try JSONDecoder().decode(DessertList.self, from: data)
                DispatchQueue.main.async {
                    // sorting by alphabetical order
                    self?.Desserts = dessertlist!.meals
                    print("got meals")
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
    
            var dessertInfo : DessertInfo?
    
            do {
                dessertInfo = try JSONDecoder().decode(DessertInfo.self, from: data)
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
