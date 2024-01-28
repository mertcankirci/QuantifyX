//
//  ContentView.swift
//  QuantifyX
//
//  Created by Mertcan Kırcı on 24.01.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeViewModel = HomePageViewModel()
    
    @State var selectedType: MeasureType = .ml
    @State var isUpwards: Bool = false
    @State var modernNum: Int = 1000
    @State var didStartScrolling: Bool = false
    @State var previousViewOffset: CGFloat = 0
    let minimumOffset: CGFloat = 80 // Optional
    
    
    var body: some View {
        ZStack {
            content
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
                .onAppear(perform: {
                    homeViewModel.getJSON()
                })
        }
        .ignoresSafeArea()
    }
    
    var content: some View {
        VStack {
            topComponent
        }
    }
    
    var topComponent: some View {
        
        ZStack {
            VStack(spacing: 0) {
                ZStack {
                    Color(hex: 0xCBCBCB)
                        .frame(height: UIScreen.screenHeight * 4 / 14)
                        .offset(y: didStartScrolling ? UIScreen.screenHeight * 1 / 55 : 0)
                    VStack {
                        topBar
                        topNumber
                    }
                }
                .offset(y: didStartScrolling ? UIScreen.screenHeight * 1 / 5 : 0)
                .blur(radius: didStartScrolling ? 3 : 0)
                
                ZStack {
                    Color(hex: 0x181818)
                        .frame(height: UIScreen.screenHeight * 10 / 14)
                        .offset(y: didStartScrolling ? -UIScreen.screenHeight * 1 / 5 : 0)
                    VStack {
                        bottomNumber
                    }
                }
                .offset(y: didStartScrolling ? UIScreen.screenHeight * 1 / 5 : 0)
            }
            if !didStartScrolling {
                arrowButton
                    .padding(.bottom, UIScreen.screenHeight * 3 / 7)
                    .onTapGesture {
                        withAnimation {
                            isUpwards.toggle()
                        }
                    }
            }
        }
    }
    
    var bottomNumber: some View {
        VStack {
            VStack(spacing: -8) {
                HStack {
                    Text("50")
                        .font(.custom("Regular", size: 52))
                    Image(systemName: "wineglass")
                        .font(.custom("Regular", size: 32))
                }
                .foregroundStyle(Color(hex: 0xCBCBCB))
                .frame(width: UIScreen.screenWidth * 4 / 10, height:  UIScreen.screenHeight / 12)
                
                Text("SU BARDAGI")
                    .foregroundStyle(Color(hex: 0x747474))
            }
            .padding(.top, UIScreen.screenHeight / 25)
            .blur(radius: didStartScrolling ? 3 : 0)
            
            ZStack {
                
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .padding(.top, 32)
                    .frame(width: UIScreen.screenWidth, height: didStartScrolling ? UIScreen.screenHeight * 5 / 5 : UIScreen.screenHeight / 2 + 50)
                
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 10) {
                        ForEach(homeViewModel.ingredientMeasurements, id: \.self) { item in
                            VStack(spacing: 30) {
                                ListView(ingredientName: item.name, ingredientAmount: "1000GR", measureTypeAndAmount: "34 Yemek kasigi", traditionalMeasure: item)
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color(hex: 0xDEDEDE))
                                    .frame(width: UIScreen.screenWidth - 60 , height: 1)
                            }
                        }
                        .padding(.top, 30)
                    }
                    .background(GeometryReader {
                        Color.clear.preference(key: ViewOffsetKey.self, value: -$0.frame(in: .named("scroll")).origin.y)
                    })
                    .onPreferenceChange(ViewOffsetKey.self) { currentOffset in
                        
                             let offsetDifference: CGFloat = self.previousViewOffset - currentOffset
                             if ( abs(offsetDifference) > minimumOffset) {
                                 if offsetDifference > 0  && currentOffset < UIScreen.screenHeight / 2 {
                                     withAnimation {
                                         didStartScrolling = false
                                     }
                                  } else {
                                          withAnimation {
                                              didStartScrolling = true
                                          }
                                  }
                                  self.previousViewOffset = currentOffset
                             }
                        }
                }
                .coordinateSpace(name: "scroll")
                .padding(.top, didStartScrolling ? 0 : 16)
            .frame(height: didStartScrolling ? UIScreen.screenHeight * 4 / 5 : UIScreen.screenHeight / 2)
            
            }
            .offset(y: didStartScrolling ? -UIScreen.screenHeight * 1 / 5 : 0)
        }
    }
    
    var topNumber: some View {
        VStack(spacing: -8) {
            Text(String(modernNum))
                .frame(width: UIScreen.screenWidth * 4 / 10, height:  UIScreen.screenHeight / 12)
                .font(.custom("Regular", size: 52))
            Text(selectedType.rawValue)
                .foregroundStyle(Color(hex: 0x747474))
        }
    }
    
    var topBar: some View {
        HStack(spacing: 0) {
            Text("ML")
                .foregroundStyle(selectedType == .ml ? Color(hex: 0x181818) : Color(hex: 0xCBCBCB))
                .frame(width: UIScreen.screenWidth / 4 , height: UIScreen.screenHeight / 23)
                .background(
                    RoundedRectangle(cornerRadius: 0.0)
                        .fill(selectedType == .ml ? Color(hex: 0xB6B6B6) : Color(hex: 0x181818))
                        .cornerRadius(5, corners: [.topLeft, .bottomLeft])
                    
                )
                .transition(.slide)
                .onTapGesture {
                    DispatchQueue.main.async {
                        withAnimation {
                            selectedType = .ml
                        }
                    }
                }
            Text("LT")
                .foregroundStyle(selectedType == .lt ? Color(hex: 0x181818) : Color(hex: 0xCBCBCB))
                .frame(width: UIScreen.screenWidth / 4, height: UIScreen.screenHeight / 23)
                .background(
                    Rectangle()
                        .fill(selectedType == .lt ? Color(hex: 0xB6B6B6) : Color(hex: 0x181818))
                    
                )
                .transition(.slide)
                .onTapGesture {
                    DispatchQueue.main.async {
                        withAnimation {
                            selectedType = .lt
                        }
                    }
                }
            
            Text("GR")
                .foregroundStyle(selectedType == .gr ? Color(hex: 0x181818) : Color(hex: 0xCBCBCB))
                .frame(width: UIScreen.screenWidth / 4, height: UIScreen.screenHeight / 23)
                .background(
                    RoundedRectangle(cornerRadius: 0.0)
                        .fill(selectedType == .gr ? Color(hex: 0xB6B6B6) : Color(hex: 0x181818))
                        .cornerRadius(5, corners: [.topRight, .bottomRight])
                    
                )
                .transition(.slide)
                .onTapGesture {
                    DispatchQueue.main.async {
                        withAnimation {
                            selectedType = .gr
                        }
                    }
                }
        }
    }
    
    var arrowButton: some View {
        ZStack {
            Circle()
                .strokeBorder(Color(hex: 0xCBCBCB), lineWidth: 5)
                .background(Circle().fill(Color(hex: 0x181818)))
                .frame(width: UIScreen.screenWidth / 6)
            Image(systemName: "arrow.down")
                .foregroundStyle(Color(hex: 0xCBCBCB))
                .font(.title)
                .rotationEffect(.degrees(isUpwards ? 180 : 0))
        }
        
    }
    
    var background: some View {
        ZStack {
            VStack(spacing: 0) {
                Color(hex: 0xCBCBCB)
                    .frame(height: UIScreen.screenHeight * 4 / 14)
                Color(hex: 0x181818)
                    .frame(height: UIScreen.screenHeight * 10 / 14)
            }
            .frame(height: UIScreen.screenHeight)
            arrowButton
                .padding(.bottom, UIScreen.screenHeight * 6 / 14)
        }
    }
}

#Preview {
    ContentView()
}
