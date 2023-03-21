//
//  DessertItem.swift
//  Dessertholic
//
//  Created by Mai Dang on 3/15/23.
//

import Foundation

//basic dessert information
struct DessertsList : Hashable, Codable {
    let meals : [DessertItem]
}

struct DessertItem : Hashable, Codable {
    let strMeal : String
    let strMealThumb : String
    let idMeal : String
}

//detailed dessert information
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
    
    private func getRawIngredients() -> [(String, String, Bool)] {
        return [(strIngredient1, strMeasure1, false),
                (strIngredient2, strMeasure2, false),
                (strIngredient3, strMeasure3, false),
                (strIngredient4, strMeasure4, false),
                (strIngredient5, strMeasure5, false),
                (strIngredient6, strMeasure6, false),
                (strIngredient7, strMeasure7, false),
                (strIngredient8, strMeasure8, false),
                (strIngredient9, strMeasure9, false),
                (strIngredient10, strMeasure10, false),
                (strIngredient11, strMeasure11, false),
                (strIngredient12, strMeasure12, false),
                (strIngredient13, strMeasure13, false),
                (strIngredient14, strMeasure14, false),
                (strIngredient15, strMeasure15, false),
                (strIngredient16, strMeasure16, false),
                (strIngredient17, strMeasure17, false),
                (strIngredient18, strMeasure18, false),
                (strIngredient19, strMeasure19, false),
                (strIngredient20, strMeasure20, false),
        ]
    }
    
    func getPresentIngredients() -> [Ingredient] {
        return getRawIngredients()
            .filter{ $0.0 != "" && $0.1 != "" }
            .map{Ingredient(label: $0.0, measurement: $0.1, isSelected: $0.2)}
    }
}

struct Ingredient : Hashable, Codable {
    var label : String
    var measurement : String
    var isSelected : Bool
}

// sample data
var expectedDessertArray = [
    [
        "strMeal": "Apam balik",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
        "idMeal": "53049"
    ],
    [
        "strMeal": "Apple & Blackberry Crumble",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
        "idMeal": "52893"
    ],
    [
        "strMeal": "Apple Frangipan Tart",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg",
        "idMeal": "52768"
    ],
    [
        "strMeal": "Bakewell tart",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg",
        "idMeal": "52767"
    ],
    [
        "strMeal": "Banana Pancakes",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
        "idMeal": "52855"
    ],
    [
        "strMeal": "Battenberg Cake",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/ywwrsp1511720277.jpg",
        "idMeal": "52894"
    ],
    [
        "strMeal": "BeaverTails",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/ryppsv1511815505.jpg",
        "idMeal": "52928"
    ],
    [
        "strMeal": "Blackberry Fool",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/rpvptu1511641092.jpg",
        "idMeal": "52891"
    ],
    [
        "strMeal": "Bread and Butter Pudding",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/xqwwpy1483908697.jpg",
        "idMeal": "52792"
    ],
    [
        "strMeal": "Budino Di Ricotta",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/1549542877.jpg",
        "idMeal": "52961"
    ],
    [
        "strMeal": "Canadian Butter Tarts",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/wpputp1511812960.jpg",
        "idMeal": "52923"
    ],
    [
        "strMeal": "Carrot Cake",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/vrspxv1511722107.jpg",
        "idMeal": "52897"
    ],
    [
        "strMeal": "Cashew Ghoriba Biscuits",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/t3r3ka1560461972.jpg",
        "idMeal": "52976"
    ],
    [
        "strMeal": "Chelsea Buns",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/vqpwrv1511723001.jpg",
        "idMeal": "52898"
    ],
    [
        "strMeal": "Chinon Apple Tarts",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/qtqwwu1511792650.jpg",
        "idMeal": "52910"
    ],
    [
        "strMeal": "Choc Chip Pecan Pie",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/rqvwxt1511384809.jpg",
        "idMeal": "52856"
    ],
    [
        "strMeal": "Chocolate Avocado Mousse",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/uttuxy1511382180.jpg",
        "idMeal": "52853"
    ],
    [
        "strMeal": "Chocolate Caramel Crispy",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/1550442508.jpg",
        "idMeal": "52966"
    ],
    [
        "strMeal": "Chocolate Gateau",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/tqtywx1468317395.jpg",
        "idMeal": "52776"
    ],
    [
        "strMeal": "Chocolate Raspberry Brownies",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/yypvst1511386427.jpg",
        "idMeal": "52860"
    ],
    [
        "strMeal": "Chocolate Souffle",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/twspvx1511784937.jpg",
        "idMeal": "52905"
    ],
    [
        "strMeal": "Christmas cake",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/ldnrm91576791881.jpg",
        "idMeal": "52990"
    ],
    [
        "strMeal": "Christmas Pudding Flapjack",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/vvusxs1483907034.jpg",
        "idMeal": "52788"
    ],
    [
        "strMeal": "Christmas Pudding Trifle",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/r33cud1576791081.jpg",
        "idMeal": "52989"
    ],
    [
        "strMeal": "Classic Christmas pudding",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/1d85821576790598.jpg",
        "idMeal": "52988"
    ],
    [
        "strMeal": "Dundee cake",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/wxyvqq1511723401.jpg",
        "idMeal": "52899"
    ],
    [
        "strMeal": "Eccles Cakes",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/wtqrqw1511639627.jpg",
        "idMeal": "52888"
    ],
    [
        "strMeal": "Eton Mess",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/uuxwvq1483907861.jpg",
        "idMeal": "52791"
    ],
    [
        "strMeal": "Honey Yogurt Cheesecake",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/y2irzl1585563479.jpg",
        "idMeal": "53007"
    ],
    [
        "strMeal": "Hot Chocolate Fudge",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/xrysxr1483568462.jpg",
        "idMeal": "52787"
    ],
    [
        "strMeal": "Jam Roly-Poly",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/ysqupp1511640538.jpg",
        "idMeal": "52890"
    ],
    [
        "strMeal": "Key Lime Pie",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/qpqtuu1511386216.jpg",
        "idMeal": "52859"
    ],
    [
        "strMeal": "Krispy Kreme Donut",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/4i5cnx1587672171.jpg",
        "idMeal": "53015"
    ],
    [
        "strMeal": "Madeira Cake",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/urtqut1511723591.jpg",
        "idMeal": "52900"
    ],
    [
        "strMeal": "Mince Pies",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/qe8pf51576795532.jpg",
        "idMeal": "52991"
    ],
    [
        "strMeal": "Nanaimo Bars",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/vwuprt1511813703.jpg",
        "idMeal": "52924"
    ],
    [
        "strMeal": "New York cheesecake",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/swttys1511385853.jpg",
        "idMeal": "52858"
    ],
    [
        "strMeal": "Pancakes",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/rwuyqx1511383174.jpg",
        "idMeal": "52854"
    ],
    [
        "strMeal": "Parkin Cake",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/qxuqtt1511724269.jpg",
        "idMeal": "52902"
    ],
    [
        "strMeal": "Peach & Blueberry Grunt",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/ssxvup1511387476.jpg",
        "idMeal": "52862"
    ],
    [
        "strMeal": "Peanut Butter Cheesecake",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/qtuuys1511387068.jpg",
        "idMeal": "52861"
    ],
    [
        "strMeal": "Peanut Butter Cookies",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/1544384070.jpg",
        "idMeal": "52958"
    ],
    [
        "strMeal": "Pear Tarte Tatin",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/rxvxrr1511797671.jpg",
        "idMeal": "52916"
    ],
    [
        "strMeal": "Polskie Naleśniki (Polish Pancakes)",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/58bkyo1593350017.jpg",
        "idMeal": "53022"
    ],
    [
        "strMeal": "Portuguese custard tarts",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/vmz7gl1614350221.jpg",
        "idMeal": "53046"
    ],
    [
        "strMeal": "Pouding chomeur",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/yqqqwu1511816912.jpg",
        "idMeal": "52932"
    ],
    [
        "strMeal": "Pumpkin Pie",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/usuqtp1511385394.jpg",
        "idMeal": "52857"
    ],
    [
        "strMeal": "Rock Cakes",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/tqrrsq1511723764.jpg",
        "idMeal": "52901"
    ],
    [
        "strMeal": "Rocky Road Fudge",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/vtxyxv1483567157.jpg",
        "idMeal": "52786"
    ],
    [
        "strMeal": "Rogaliki (Polish Croissant Cookies)",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/7mxnzz1593350801.jpg",
        "idMeal": "53024"
    ],
    [
        "strMeal": "Salted Caramel Cheescake",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/xqrwyr1511133646.jpg",
        "idMeal": "52833"
    ],
    [
        "strMeal": "Seri muka kuih",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/6ut2og1619790195.jpg",
        "idMeal": "53054"
    ],
    [
        "strMeal": "Spotted Dick",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/xqvyqr1511638875.jpg",
        "idMeal": "52886"
    ],
    [
        "strMeal": "Sticky Toffee Pudding",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/xqqqtu1511637379.jpg",
        "idMeal": "52883"
    ],
    [
        "strMeal": "Sticky Toffee Pudding Ultimate",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/xrptpq1483909204.jpg",
        "idMeal": "52793"
    ],
    [
        "strMeal": "Strawberry Rhubarb Pie",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/178z5o1585514569.jpg",
        "idMeal": "53005"
    ],
    [
        "strMeal": "Sugar Pie",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/yrstur1511816601.jpg",
        "idMeal": "52931"
    ],
    [
        "strMeal": "Summer Pudding",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/rsqwus1511640214.jpg",
        "idMeal": "52889"
    ],
    [
        "strMeal": "Tarte Tatin",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/ryspuw1511786688.jpg",
        "idMeal": "52909"
    ],
    [
        "strMeal": "Timbits",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/txsupu1511815755.jpg",
        "idMeal": "52929"
    ],
    [
        "strMeal": "Treacle Tart",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/wprvrw1511641295.jpg",
        "idMeal": "52892"
    ],
    [
        "strMeal": "Tunisian Orange Cake",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/y4jpgq1560459207.jpg",
        "idMeal": "52970"
    ],
    [
        "strMeal": "Walnut Roll Gužvara",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/u9l7k81628771647.jpg",
        "idMeal": "53062"
    ],
    [
        "strMeal": "White chocolate creme brulee",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/uryqru1511798039.jpg",
        "idMeal": "52917"
    ]
]

var expectedDessertDetail = DessertDetail(idMeal: "52893",
                                          strMeal: "Apple & Blackberry Crumble",
                                          strDrinkAlternate: nil,
                                          strCategory: "Dessert",
                                          strArea: "British",
                                          strInstructions: """
                                            Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.
                                            Meanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.
                                            To serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.
                                            """,
                                          strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
                                          strTags: "Pudding",
                                          strYoutube:
                                            "https://www.youtube.com/watch?v=4vhcOwVBDO4",
                                          strIngredient1: "Plain Flour",
                                          strIngredient2: "Caster Sugar",
                                          strIngredient3: "Butter",
                                          strIngredient4: "Braeburn Apples",
                                          strIngredient5: "Butter",
                                          strIngredient6: "Demerara Sugar",
                                          strIngredient7: "Blackberrys",
                                          strIngredient8: "Cinnamon",
                                          strIngredient9: "Ice Cream",
                                          strIngredient10: "",
                                          strIngredient11: "",
                                          strIngredient12: "",
                                          strIngredient13: "",
                                          strIngredient14: "",
                                          strIngredient15: "",
                                          strIngredient16: "",
                                          strIngredient17: "",
                                          strIngredient18: "",
                                          strIngredient19: "",
                                          strIngredient20: "",
                                          strMeasure1: "120g",
                                          strMeasure2: "60g",
                                          strMeasure3: "60g",
                                          strMeasure4: "300g",
                                          strMeasure5: "30g",
                                          strMeasure6: "30g",
                                          strMeasure7: "120g",
                                          strMeasure8: "¼ teaspoon",
                                          strMeasure9: "to serve",
                                          strMeasure10: "",
                                          strMeasure11: "",
                                          strMeasure12: "",
                                          strMeasure13: "",
                                          strMeasure14: "",
                                          strMeasure15: "",
                                          strMeasure16: "",
                                          strMeasure17: "",
                                          strMeasure18: "",
                                          strMeasure19: "",
                                          strMeasure20: "",
                                          strSource: "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
                                          strImageSource: nil,
                                          strCreativeCommonsConfirmed: nil,
                                          dateModified: nil)
