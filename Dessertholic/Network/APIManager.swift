//
//  APIManager.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/15/23.
//

import Foundation

class APIManager : ObservableObject {
    private var api = "https://themealdb.com/api/json/v1/1/"
    private var dessertCatergory = "filter.php?c=Dessert"
    private var lookUp = "lookup.php?i="
    @Published var dessertItemArr : [DessertItem] = []
    @Published var dessertDetailArr : [DessertDetail] = []
        
    func fetchDessertItemsArr(onSuccess : @escaping (Bool) -> Void) {
        guard let url = URL(string: "\(api)\(dessertCatergory)") else {
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
                DispatchQueue.main.sync {
                    self?.dessertItemArr = dessertlist!.meals
                        .sorted(by: { dessert1, dessert2 in
                            dessert1.strMeal.lowercased() < dessert2.strMeal.lowercased()
                        })
                    let tempDessertItempArr = dessertlist!.meals
                        .sorted(by: { dessert1, dessert2 in
                            dessert1.strMeal.lowercased() < dessert2.strMeal.lowercased()
                        })
                    onSuccess(true)
                    print("got dessert data")
                }
            } catch {
                onSuccess(false)
                print("could not convert data to Objects")
            }
        }.resume()
    }
    
    func fetchDessertInfo(dessertID : String, onSuccess : @escaping (Bool) -> Void) {
        
        guard let url = URL(string: "\(api)\(lookUp)\(dessertID)") else {
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
                DispatchQueue.main.sync {
                    self?.dessertDetailArr = dessertInfo!.meals
                    let tempDessertDetailArr = dessertInfo!.meals
                    print("dessert info")
                    onSuccess(true)
                }
            } catch {
                onSuccess(false)
                print("could not convert data to Objects")
            }
        }.resume()
    }
}
