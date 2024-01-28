//
//  ViewOffsetKey.swift
//  QuantifyX
//
//  Created by Mertcan Kırcı on 29.01.2024.
//

import SwiftUI

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
