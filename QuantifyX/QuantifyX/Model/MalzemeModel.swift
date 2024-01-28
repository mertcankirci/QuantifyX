//
//  MalzemeModel.swift
//  QuantifyX
//
//  Created by Mertcan Kırcı on 24.01.2024.
//

import Foundation

struct ResultIngredients: Codable, Hashable {
    let malzemeler: [Ingredient]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(malzemeler)
    }
}

struct Ingredient: Codable, Hashable {
    let name: String
    let olculer: MeasureUnit
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(olculer)
    }
}

struct MeasureUnit: Codable, Hashable {
    let suBardagi: Int?
    let cayBardagi: Int?
    let yemekKasigi: Int?
    let tatliKasigi: Int?
    let cayKasigi: Int?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(suBardagi)
        hasher.combine(cayBardagi)
        hasher.combine(yemekKasigi)
        hasher.combine(tatliKasigi)
        hasher.combine(cayKasigi)
    }
}


enum MeasureType: String, CaseIterable {
    case ml = "MİLİLİTRE"
    case lt = "LİTRE"
    case gr = "GRAM"
}
