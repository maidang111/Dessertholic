//
//  DessertholicTests.swift
//  DessertholicTests
//
//  Created by Mai Dang on 3/20/23.
//

import XCTest
@testable import Dessertholic

final class DessertholicTests: XCTestCase {
    
    var DessertData = APIManager()
    
    func test_noErrors_Thrown() {
        XCTAssertNoThrow(DessertData.fetchDessertInfo(dessertID: "53048", onSuccess: { status in }))
        XCTAssertNoThrow(DessertData.fetchDessertItemsArr(onSuccess: { status in }))
    }
    
    func test_fetch_Desserts_From_API() async throws {
        DessertData.fetchDessertItemsArr{ status in }
        sleep(1)
        
        XCTAssertEqual(DessertData.dessertItemArr.count, 64)
        
        for i in 0...63 {
            XCTAssertEqual(DessertData.dessertItemArr[i].strMeal, expectedDessertArray[i]["strMeal"])
            XCTAssertEqual(DessertData.dessertItemArr[i].strMealThumb, expectedDessertArray[i]["strMealThumb"])
            XCTAssertEqual(DessertData.dessertItemArr[i].idMeal, expectedDessertArray[i]["idMeal"])
        }
        
    }
    
    func test_fetch_Dessert_Details() async throws {
        DessertData.fetchDessertInfo(dessertID: "52893", onSuccess: { Status in})
        sleep(1)
        
        XCTAssertEqual(DessertData.dessertDetailArr.count, 1)
        XCTAssertEqual(DessertData.dessertDetailArr[0].idMeal, expectedDessertDetail.idMeal)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeal, expectedDessertDetail.strMeal)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strDrinkAlternate, expectedDessertDetail.strDrinkAlternate)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strCategory, expectedDessertDetail.strCategory)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strArea, expectedDessertDetail.strArea)
        XCTAssertEqual(DessertData.dessertDetailArr[0].formatedStrInstructions, expectedDessertDetail.formatedStrInstructions)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMealThumb, expectedDessertDetail.strMealThumb)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strTags, expectedDessertDetail.strTags)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strYoutube, expectedDessertDetail.strYoutube)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient1, expectedDessertDetail.strIngredient1)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient2, expectedDessertDetail.strIngredient2)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient3, expectedDessertDetail.strIngredient3)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient4, expectedDessertDetail.strIngredient4)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient5, expectedDessertDetail.strIngredient5)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient6, expectedDessertDetail.strIngredient6)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient7, expectedDessertDetail.strIngredient7)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient8, expectedDessertDetail.strIngredient8)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient9, expectedDessertDetail.strIngredient9)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient10, expectedDessertDetail.strIngredient10)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient11, expectedDessertDetail.strIngredient11)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient12, expectedDessertDetail.strIngredient12)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient13, expectedDessertDetail.strIngredient13)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient14, expectedDessertDetail.strIngredient14)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient15, expectedDessertDetail.strIngredient15)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient16, expectedDessertDetail.strIngredient16)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient17, expectedDessertDetail.strIngredient17)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient18, expectedDessertDetail.strIngredient18)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient19, expectedDessertDetail.strIngredient19)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strIngredient20, expectedDessertDetail.strIngredient20)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure1, expectedDessertDetail.strMeasure1)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure2, expectedDessertDetail.strMeasure2)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure3, expectedDessertDetail.strMeasure3)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure4, expectedDessertDetail.strMeasure4)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure5, expectedDessertDetail.strMeasure5)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure6, expectedDessertDetail.strMeasure6)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure7, expectedDessertDetail.strMeasure7)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure8, expectedDessertDetail.strMeasure8)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure9, expectedDessertDetail.strMeasure9)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure10, expectedDessertDetail.strMeasure10)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure11, expectedDessertDetail.strMeasure11)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure12, expectedDessertDetail.strMeasure12)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure13, expectedDessertDetail.strMeasure13)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure14, expectedDessertDetail.strMeasure14)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure15, expectedDessertDetail.strMeasure15)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure16, expectedDessertDetail.strMeasure16)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure17, expectedDessertDetail.strMeasure17)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure19, expectedDessertDetail.strMeasure19)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strMeasure20, expectedDessertDetail.strMeasure20)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strSource, expectedDessertDetail.strSource)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strImageSource, expectedDessertDetail.strImageSource)
        XCTAssertEqual(DessertData.dessertDetailArr[0].strCreativeCommonsConfirmed, expectedDessertDetail.strCreativeCommonsConfirmed)
        XCTAssertEqual(DessertData.dessertDetailArr[0].dateModified, expectedDessertDetail.dateModified)
    }
       
        
    
}

