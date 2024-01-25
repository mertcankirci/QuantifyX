//
//  MalzemeModel.swift
//  QuantifyX
//
//  Created by Mertcan Kırcı on 24.01.2024.
//

import Foundation

struct ResultIngredients: Codable {
    let malzemeler: [Ingredient]
}

struct Ingredient: Codable {
    let name: String
    let olculer: MeasureUnit
}

struct MeasureUnit: Codable {
    let suBardagi: Int?
    let cayBardagi: Int?
    let yemekKasigi: Int?
    let tatliKasigi: Int?
    let cayKasigi: Int?
}

enum MeasureType: String, CaseIterable {
    case ml = "MİLİLİTRE"
    case lt = "LİTRE"
    case gr = "GRAM"
}
