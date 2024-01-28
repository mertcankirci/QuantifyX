//
//  ListView.swift
//  QuantifyX
//
//  Created by Mertcan Kırcı on 26.01.2024.
//

import SwiftUI

struct ListView: View {
    @State var ingredientName: String
    @State var ingredientAmount: String
    @State var measureTypeAndAmount: String
    @State var traditionalMeasure: Ingredient
    @State private var didTapArrow: Bool = false
    
    let columns = [
        GridItem(.adaptive(minimum: 120, maximum: 500))
        
        
    ]
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(ingredientAmount)
                        .foregroundStyle(Color(hex:0x949494))
                        .font(.footnote)
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                        .frame(maxWidth: 120)
                        .fixedSize(horizontal: false, vertical: true)
                        
                    
                    Text(traditionalMeasure.name.uppercased())
                        .foregroundStyle(Color(hex:0x444444))
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                        .frame(maxWidth: 120)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                Spacer()
                
                HStack {
                    Text(measureTypeAndAmount)
                    Image(systemName: "greaterthan")
                        .foregroundStyle(Color(hex: 0x282828))
                        .font(.custom("Regular", size: 14).bold())
                        .rotationEffect(.degrees(didTapArrow ? 90 : 0))
                }
                .padding(6)
                .foregroundStyle(Color(hex:0x212121))
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(didTapArrow ? Color.white : Color(hex:0xEBEBEB))
                )
                .onTapGesture {
                    withAnimation {
                        didTapArrow.toggle()
                    }
                }
                
            }
            
//            if !didTapArrow {
//                RoundedRectangle(cornerRadius: 5)
//                    .fill(Color(hex: 0xDEDEDE))
//                    .frame(height: 1)
//            }
        //    else {
            if didTapArrow {
                LazyVGrid(columns: columns, spacing: 20, content: {
                    if traditionalMeasure.olculer.cayBardagi != nil {
                        VStack {
                            Text(String(traditionalMeasure.olculer.cayBardagi!))
                                .foregroundStyle(Color(hex: 0x949494))
                                .font(.callout)
                                .frame(width: (UIScreen.screenWidth - 60) * 3 / 10, alignment: .leading)
                            
                            Text("CAY BARDAGI")
                                .foregroundStyle(Color(hex: 0x444444))
                                .scaledToFit()
                                .minimumScaleFactor(0.5)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            
                        }
                        .frame(width: (UIScreen.screenWidth - 60) * 3 / 10)
                        .frame(maxHeight: 50)
                    }
                    if traditionalMeasure.olculer.yemekKasigi != nil {
                        VStack {
                            Text(String(traditionalMeasure.olculer.yemekKasigi!))
                                .foregroundStyle(Color(hex: 0x949494))
                                .font(.callout)
                                .frame(width: (UIScreen.screenWidth - 60) * 3 / 10, alignment: .leading)
                            
                            Text("YEMEK KASIGI")
                                .foregroundStyle(Color(hex: 0x444444))
                                .scaledToFit()
                                .minimumScaleFactor(0.5)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        }
                        .frame(width: (UIScreen.screenWidth - 60) * 3 / 10)
                        .frame(maxHeight: 50)
                    }
                    if traditionalMeasure.olculer.tatliKasigi != nil {
                        VStack {
                            Text(String(traditionalMeasure.olculer.tatliKasigi!))
                                .foregroundStyle(Color(hex: 0x949494))
                                .font(.callout)
                                .frame(width: (UIScreen.screenWidth - 60) * 3 / 10, alignment: .leading)
                            
                            Text("TATLI KASIGI")
                                .foregroundStyle(Color(hex: 0x444444))
                                .scaledToFit()
                                .minimumScaleFactor(0.5)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        }
                        .frame(width: (UIScreen.screenWidth - 60) * 3 / 10)
                        .frame(maxHeight: 50)
                    }
                    if traditionalMeasure.olculer.cayKasigi != nil {
                        VStack {
                            Text(String(traditionalMeasure.olculer.cayKasigi!))
                                .foregroundStyle(Color(hex: 0x949494))
                                .font(.callout)
                                .frame(width: (UIScreen.screenWidth - 60) * 3 / 10, alignment: .leading)
                            
                            
                            Text("CAY KASIGI")
                                .foregroundStyle(Color(hex: 0x444444))
                                .scaledToFit()
                                .minimumScaleFactor(0.5)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .frame(width: (UIScreen.screenWidth - 60) * 3 / 10, alignment: .leading)
                        }
                        .frame(width: (UIScreen.screenWidth - 60) * 3 / 10)
                        .frame(maxHeight: 50)
                    }
                    
                })
                .frame(width: UIScreen.screenWidth - 80)
            }
            //}
        }
        .frame(width: UIScreen.screenWidth - 60)
    }
}

#Preview {
    ListView(ingredientName: "SEKER", ingredientAmount: "1000GR", measureTypeAndAmount: "34 YEMEK KASIGI", traditionalMeasure: Ingredient(name: "SEKER", olculer: MeasureUnit(suBardagi: 5, cayBardagi: 10, yemekKasigi: 20, tatliKasigi: 40, cayKasigi: 80)))
        .frame(height: 100)
}
