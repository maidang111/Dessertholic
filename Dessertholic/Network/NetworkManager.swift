//
//  APIManager.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/15/23.
//

import Foundation

class NetworkManager : NSObject {
    private let api = "https://themealdb.com/api/json/v1/1/"
    private let dessertCatergory = "filter.php?c=Dessert"
    private let lookUp = "lookup.php?i="
    static let shared = NetworkManager()
    
    func fetchDessertItemsArr(onSuccess : @escaping (Bool, [DessertItem]) -> Void) {
        
        // This attempts to create a url
        guard let url = URL(string: "\(api)\(dessertCatergory)") else {
            print("couldn't convert to url")
            return
        }
        
        // This fetches data from vaild URL
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("\(error!)")
                return
            }
            
            // If data is valid return: (true, [DessertItem]), else: (false, [])
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
                print("Failed to parse JSON into DessertItem")
            }
        }.resume()
    }
    
    func fetchDessertInfo(dessertID : String, onSuccess : @escaping (Bool, [DessertDetail]) -> Void) {
        
        // Creating url
        guard let url = URL(string: "\(api)\(lookUp)\(dessertID)") else {
            print("couldn't convert to url")
            return
        }
        
        // Fetching data
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("\(error!)")
                return
            }
            
            var dessertInfo : Dessert?
            
            // If data is valid return: (true, [DessertItem]), else: (false, [])
            do {
                dessertInfo = try JSONDecoder().decode(Dessert.self, from: data)
                DispatchQueue.main.sync {
                    let tempDessertDetailArr = dessertInfo!.meals
                    print("dessert info")
                    onSuccess(true, tempDessertDetailArr)
                }
            } catch {
                print("could not convert data to Objects")
            }
        }.resume()
    }
}
