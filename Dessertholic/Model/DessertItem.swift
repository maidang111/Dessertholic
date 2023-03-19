//
//  DessertItem.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/15/23.
//

import Foundation

struct DessertsList : Hashable, Codable {
    let meals : [DessertItem]
}

struct DessertItem : Hashable, Codable {
    let strMeal : String
    let strMealThumb : String
    let idMeal : String
}

struct Dessert : Hashable, Codable {
    let meals : [DessertDetail]
}

struct DessertDetail : Hashable, Codable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions : String
    var formatedStrInstructions : AttributedString {
        do {
            return try AttributedString(markdown: strInstructions)
        } catch {
            print("Error setting formatetStrIntstructions\(error)")
            return ""
        }
    }
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strIngredient11: String
    let strIngredient12: String
    let strIngredient13: String
    let strIngredient14: String
    let strIngredient15: String
    let strIngredient16: String
    let strIngredient17: String
    let strIngredient18: String
    let strIngredient19: String
    let strIngredient20: String
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    let strMeasure8: String
    let strMeasure9: String
    let strMeasure10: String
    let strMeasure11: String
    let strMeasure12: String
    let strMeasure13: String
    let strMeasure14: String
    let strMeasure15: String
    let strMeasure16: String
    let strMeasure17: String
    let strMeasure18: String
    let strMeasure19: String
    let strMeasure20: String
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: Bool?
    let dateModified: String?
    
    private func getRawIngredients() -> [(String, String)] {
        return [(strIngredient1, strMeasure1),
                (strIngredient2, strMeasure2),
                (strIngredient3, strMeasure3),
                (strIngredient4, strMeasure4),
                (strIngredient5, strMeasure5),
                (strIngredient6, strMeasure6),
                (strIngredient7, strMeasure7),
                (strIngredient8, strMeasure8),
                (strIngredient9, strMeasure9),
                (strIngredient10, strMeasure10),
                (strIngredient11, strMeasure11),
                (strIngredient12, strMeasure12),
                (strIngredient13, strMeasure13),
                (strIngredient14, strMeasure14),
                (strIngredient15, strMeasure15),
                (strIngredient16, strMeasure16),
                (strIngredient17, strMeasure17),
                (strIngredient18, strMeasure18),
                (strIngredient19, strMeasure19),
                (strIngredient20, strMeasure20),
        ]
    }
    
    func getPresentIngredients() -> [Ingredient] {
        return getRawIngredients()
            .filter{ $0.0 != "" && $0.1 != "" }
            .map{Ingredient(label: $0.0, measurement: $0.1)}
    }
}


struct Ingredient : Hashable, Codable {
    var label : String
    var measurement : String
}
