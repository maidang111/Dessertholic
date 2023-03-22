//
//  DessertholicTests.swift
//  DessertholicTests
//
//  Created by Mai Dang on 3/20/23.
//

import XCTest
@testable import Dessertholic

final class DessertholicTests: XCTestCase {
    let item = DessertViewModel()
    let details = LookUpViewModel()
    
    // This checks if ViewModels are throwing errors
    func test_noErrors_Thrown() {
        XCTAssertNoThrow(item.fetchDessertItemsArr())
        XCTAssertNoThrow(details.fetchDessertDetailsArr(dessertID: "53049"))
    }
    
    // This checks if fetching array of DessertItem returns expect array
    func test_fetch_Desserts_From_API() async throws {
        item.fetchDessertItemsArr()
        sleep(1)
        
        XCTAssertEqual(item.dessertItemArr.count, 64)
        
        for i in 0...63 {
            XCTAssertEqual(item.dessertItemArr[i].strMeal, expectedDessertArray[i]["strMeal"])
            XCTAssertEqual(item.dessertItemArr[i].strMealThumb, expectedDessertArray[i]["strMealThumb"])
            XCTAssertEqual(item.dessertItemArr[i].idMeal, expectedDessertArray[i]["idMeal"])
        }
        
    }
    
    // This checks if fetching dessertDetails returns expected variables
    func test_fetch_Dessert_Details() async throws {
        details.fetchDessertDetailsArr(dessertID: "52893")
        sleep(1)
        
        XCTAssertEqual(details.dessertDetailsArray.count, 1)
        XCTAssertEqual(details.dessertDetailsArray[0].idMeal, expectedDessertDetail.idMeal)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeal, expectedDessertDetail.strMeal)
        XCTAssertEqual(details.dessertDetailsArray[0].strDrinkAlternate, expectedDessertDetail.strDrinkAlternate)
        XCTAssertEqual(details.dessertDetailsArray[0].strCategory, expectedDessertDetail.strCategory)
        XCTAssertEqual(details.dessertDetailsArray[0].strArea, expectedDessertDetail.strArea)
        XCTAssertEqual(details.dessertDetailsArray[0].formatedStrInstructions, expectedDessertDetail.formatedStrInstructions)
        XCTAssertEqual(details.dessertDetailsArray[0].strMealThumb, expectedDessertDetail.strMealThumb)
        XCTAssertEqual(details.dessertDetailsArray[0].strTags, expectedDessertDetail.strTags)
        XCTAssertEqual(details.dessertDetailsArray[0].strYoutube, expectedDessertDetail.strYoutube)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient1, expectedDessertDetail.strIngredient1)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient2, expectedDessertDetail.strIngredient2)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient3, expectedDessertDetail.strIngredient3)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient4, expectedDessertDetail.strIngredient4)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient5, expectedDessertDetail.strIngredient5)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient6, expectedDessertDetail.strIngredient6)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient7, expectedDessertDetail.strIngredient7)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient8, expectedDessertDetail.strIngredient8)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient9, expectedDessertDetail.strIngredient9)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient10, expectedDessertDetail.strIngredient10)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient11, expectedDessertDetail.strIngredient11)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient12, expectedDessertDetail.strIngredient12)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient13, expectedDessertDetail.strIngredient13)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient14, expectedDessertDetail.strIngredient14)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient15, expectedDessertDetail.strIngredient15)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient16, expectedDessertDetail.strIngredient16)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient17, expectedDessertDetail.strIngredient17)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient18, expectedDessertDetail.strIngredient18)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient19, expectedDessertDetail.strIngredient19)
        XCTAssertEqual(details.dessertDetailsArray[0].strIngredient20, expectedDessertDetail.strIngredient20)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure1, expectedDessertDetail.strMeasure1)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure2, expectedDessertDetail.strMeasure2)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure3, expectedDessertDetail.strMeasure3)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure4, expectedDessertDetail.strMeasure4)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure5, expectedDessertDetail.strMeasure5)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure6, expectedDessertDetail.strMeasure6)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure7, expectedDessertDetail.strMeasure7)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure8, expectedDessertDetail.strMeasure8)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure9, expectedDessertDetail.strMeasure9)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure10, expectedDessertDetail.strMeasure10)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure11, expectedDessertDetail.strMeasure11)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure12, expectedDessertDetail.strMeasure12)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure13, expectedDessertDetail.strMeasure13)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure14, expectedDessertDetail.strMeasure14)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure15, expectedDessertDetail.strMeasure15)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure16, expectedDessertDetail.strMeasure16)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure17, expectedDessertDetail.strMeasure17)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure19, expectedDessertDetail.strMeasure19)
        XCTAssertEqual(details.dessertDetailsArray[0].strMeasure20, expectedDessertDetail.strMeasure20)
        XCTAssertEqual(details.dessertDetailsArray[0].strSource, expectedDessertDetail.strSource)
        XCTAssertEqual(details.dessertDetailsArray[0].strImageSource, expectedDessertDetail.strImageSource)
        XCTAssertEqual(details.dessertDetailsArray[0].strCreativeCommonsConfirmed, expectedDessertDetail.strCreativeCommonsConfirmed)
        XCTAssertEqual(details.dessertDetailsArray[0].dateModified, expectedDessertDetail.dateModified)
    }
}

