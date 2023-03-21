//
//  APIManager.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/15/23.
//

import Foundation

class NetworkManager : NSObject {
    private var api = "https://themealdb.com/api/json/v1/1/"
    private var dessertCatergory = "filter.php?c=Dessert"
    private var lookUp = "lookup.php?i="
    static let shared = NetworkManager()
    
    func fetchDessertItemsArr(onSuccess : @escaping (Bool, [DessertItem]) -> Void) {
        
        // creating url
        guard let url = URL(string: "\(api)\(dessertCatergory)") else {
            print("couldn't convert to url")
            return
        }
        
        //fetching data
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("\(error!)")
                return
            }
            
            // if data is valid return: (true, [DessertItem]), else: (false, [])
            var dessertlist : DessertsList?
            do {
                dessertlist = try JSONDecoder().decode(DessertsList.self, from: data)
                DispatchQueue.main.sync {
                    let tempDessertItempArr = dessertlist!.meals
                        .sorted(by: { dessert1, dessert2 in
                            dessert1.strMeal.lowercased() < dessert2.strMeal.lowercased()
                        })
                    onSuccess(true, tempDessertItempArr)
                    print("got dessert data")
                }
            } catch {
                onSuccess(false, [])
                print("could not convert data to Objects")
            }
        }.resume()
    }
    
    func fetchDessertInfo(dessertID : String, onSuccess : @escaping (Bool, [DessertDetail]) -> Void) {
        
        // creating url
        guard let url = URL(string: "\(api)\(lookUp)\(dessertID)") else {
            print("couldn't convert to url")
            return
        }
        
        //fetching data
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("\(error!)")
                return
            }
            
            var dessertInfo : Dessert?
            
            // if data is valid return: (true, [DessertItem]), else: (false, [])
            do {
                dessertInfo = try JSONDecoder().decode(Dessert.self, from: data)
                DispatchQueue.main.sync {
                    let tempDessertDetailArr = dessertInfo!.meals
                    print("dessert info")
                    onSuccess(true, tempDessertDetailArr)
                }
            } catch {
                onSuccess(false, [])
                print("could not convert data to Objects")
            }
        }.resume()
    }
}
