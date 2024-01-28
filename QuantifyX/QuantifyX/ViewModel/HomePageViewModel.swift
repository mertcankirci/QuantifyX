//
//  HomePageViewModel.swift
//  QuantifyX
//
//  Created by Mertcan Kırcı on 24.01.2024.
//

import Foundation

@MainActor
class HomePageViewModel: ObservableObject {
    
    let jsonString =
 """
{
  "malzemeler": [
    {
      "name": "Antep Fıstığı",
      "olculer": {
        "suBardagi": 100,
        "cayBardagi": 50,
        "yemekKasigi": 10,
        "tatliKasigi": 5,
        "cayKasigi": 2
      }
    },
    {
      "name": "Badem-Bütün",
      "olculer": {
        "suBardagi": 100,
        "cayBardagi": 50,
        "yemekKasigi": 10,
        "tatliKasigi": 5,
        "cayKasigi": 2
      }
    },
    {
      "name": "Badem-Yaprak",
      "olculer": {
        "suBardagi": 90,
        "cayBardagi": 45,
        "yemekKasigi": 8,
        "tatliKasigi": 4,
        "cayKasigi": 2
      }
    },
    {
      "name": "Badem-Kırılmış",
      "olculer": {
        "suBardagi": 120,
        "cayBardagi": 60,
        "yemekKasigi": 10,
        "tatliKasigi": 5,
        "cayKasigi": 2
      }
    },
    {
      "name": "Badem-Öğütülmüş",
      "olculer": {
        "suBardagi": 100,
        "cayBardagi": 50,
        "yemekKasigi": 8,
        "tatliKasigi": 4,
        "cayKasigi": 2
      }
    },
    {
      "name": "Bal",
      "olculer": {
        "suBardagi": 290,
        "cayBardagi": 145,
        "yemekKasigi": 20
      }
    },
    {
      "name": "Buğday unu",
      "olculer": {
        "suBardagi": 110,
        "cayBardagi": 55,
        "yemekKasigi": 10,
        "tatliKasigi": 5,
        "cayKasigi": 2
      }
    },
    {
      "name": "Ceviz-Kırılmış",
      "olculer": {
        "suBardagi": 100,
        "cayBardagi": 50,
        "yemekKasigi": 8,
        "tatliKasigi": 4,
        "cayKasigi": 2
      }
    },
    {
      "name": "Ceviz-Öğütülmüş",
      "olculer": {
        "suBardagi": 90,
        "cayBardagi": 45,
        "yemekKasigi": 8,
        "tatliKasigi": 4,
        "cayKasigi": 2
      }
    },
    {
      "name": "Cekirdeksiz Kuru Üzüm",
      "olculer": {
        "suBardagi": 120,
        "cayBardagi": 60,
        "yemekKasigi": 10,
        "tatliKasigi": 5,
        "cayKasigi": 2
      }
    },
    {
      "name": "Hamur Kabartma Tozu",
      "olculer": {
        "tatliKasigi": 4,
        "cayKasigi": 2
      }
    },
    {
      "name": "Kakao",
      "olculer": {
        "suBardagi": 70,
        "cayBardagi": 35,
        "yemekKasigi": 8,
        "tatliKasigi": 4,
        "cayKasigi": 2
      }
    },
    {
      "name": "Pudra Şekeri",
      "olculer": {
        "suBardagi": 140,
        "cayBardagi": 70,
        "yemekKasigi": 10,
        "tatliKasigi": 5,
        "cayKasigi": 2
      }
    },
    {
      "name": "Esmer Şeker",
      "olculer": {
        "suBardagi": 120,
        "cayBardagi": 60
      }
    },
    {
      "name": "Fındık",
      "olculer": {
        "suBardagi": 100,
        "cayBardagi": 50,
        "yemekKasigi": 7,
        "tatliKasigi": 4,
        "cayKasigi": 2
      }
    },
    {
      "name": "Galeta Unu",
      "olculer": {
        "suBardagi": 100,
        "cayBardagi": 50,
        "yemekKasigi": 8,
        "tatliKasigi": 4,
        "cayKasigi": 2
      }
    },
    {
      "name": "İrmik",
      "olculer": {
        "suBardagi": 150,
        "cayBardagi": 75
      }
    },
    {
      "name": "Kaşar Peyniri rendesi",
      "olculer": {
        "suBardagi": 80,
        "cayBardagi": 40
      }
    },
    {
      "name": "Kepekli Un",
      "olculer": {
        "suBardagi": 100,
        "cayBardagi": 50
      }
    },
    {
      "name": "Kuru Kayısı",
      "olculer": {
        "suBardagi": 140,
        "cayBardagi": 70
      }
    },
    {
      "name": "Mısır Unu",
      "olculer": {
        "suBardagi": 100,
        "cayBardagi": 50,
        "yemekKasigi": 8,
        "tatliKasigi": 4,
        "cayKasigi": 2
      }
    },
    {
      "name": "Nişasta",
      "olculer": {
        "suBardagi": 100,
        "cayBardagi": 50,
        "yemekKasigi": 8,
        "tatliKasigi": 4,
        "cayKasigi": 2
      }
    },
    {
      "name": "Reçel",
      "olculer": {
        "suBardagi": 250,
        "cayBardagi": 125
      }
    },
    {
      "name": "Susam",
      "olculer": {
        "suBardagi": 120,
        "cayBardagi": 60
      }
    },
    {
      "name": "Süzme Yoğurt",
      "olculer": {
        "suBardagi": 200,
        "cayBardagi": 100,
      }
    },
    {
      "name": "Tam Buğday Unu",
      "olculer": {
        "suBardagi": 110,
        "cayBardagi": 55,
        "yemekKasigi": 10,
        "tatliKasigi": 5,
        "cayKasigi": 2
      }
    },
    {
      "name": "Toz Şeker",
      "olculer": {
        "suBardagi": 170,
        "cayBardagi": 85,
        "yemekKasigi": 12,
        "tatliKasigi": 6,
        "cayKasigi": 3
      }
    },
    {
      "name": "Vişne",
      "olculer": {
        "suBardagi": 120,
        "cayBardagi": 60
      }
    },
    {
      "name": "Yer Fıstığı",
      "olculer": {
        "suBardagi": 120,
        "cayBardagi": 60
      }
    },
    {
      "name": "Yoğurt",
      "olculer": {
        "suBardagi": 200,
        "cayBardagi": 100
      }
    },
    {
      "name": "Yulaf Ezmesi",
      "olculer": {
        "suBardagi": 80,
        "cayBardagi": 40
      }
    },
    {
      "name": "Zeytin",
      "olculer": {
        "suBardagi": 120,
        "cayBardagi": 60
      }
    },
    {
      "name": "Bulgur",
      "olculer": {
        "suBardagi": 170,
        "cayBardagi": 80,
        "yemekKasigi": 20,
        "tatliKasigi": 10,
        "cayKasigi": 4
      }
    },
    {
      "name": "Pirinç",
      "olculer": {
        "suBardagi": 160,
        "cayBardagi": 80,
        "yemekKasigi": 20,
        "tatliKasigi": 10,
        "cayKasigi": 4
      }
    },
    {
      "name": "Salça",
      "olculer": {
        "suBardagi": 220,
        "cayBardagi": 95,
        "yemekKasigi": 40,
        "tatliKasigi": 20,
        "cayKasigi": 10
      }
    },
    {
      "name": "Tereyağı",
      "olculer": {
        "suBardagi": 180,
        "cayBardagi": 90,
        "yemekKasigi": 20,
        "tatliKasigi": 10,
        "cayKasigi": 2
      }
    }
  ]
}

"""
    
    @Published var ingredientMeasurements: [Ingredient] = []
    
    @MainActor
    func getJSON() {
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                self.ingredientMeasurements = try JSONDecoder().decode(ResultIngredients.self, from: jsonData).malzemeler
            } catch(let error) {
                #if DEBUG
                print(error)
                #endif
            }
        }
    }
    
    @MainActor
    func calculateAmount(ingredient: Ingredient, amount: Int, desiredType: String) -> Int? {

        switch desiredType {
        case "suBardagi":
            return ingredient.olculer.suBardagi.map { amount / $0 }
        case "cayBardagi":
            return ingredient.olculer.cayBardagi.map { amount / $0 }
        case "yemekKasigi":
            return ingredient.olculer.yemekKasigi.map { amount / $0 }
        case "tatliKasigi":
            return ingredient.olculer.tatliKasigi.map { amount / $0 }
        case "cayKasigi":
            return ingredient.olculer.cayKasigi.map { amount / $0 }
        default:
            return nil 
        }
        
    }
    
    
}
