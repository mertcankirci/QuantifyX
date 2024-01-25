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
    @State var modernAmount: Int = 0
    
    var body: some View {
        ZStack {
            content
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
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
                    VStack {
                        topBar
                        topNumber
                    }
                }
                ZStack {
                    Color(hex: 0x181818)
                        .frame(height: UIScreen.screenHeight * 10 / 14)
                    VStack {
                        bottomNumber
                    }
                }
            }
            arrowButton
                .padding(.bottom, UIScreen.screenHeight * 3 / 7)
        }
    }
    
    var bottomNumber: some View {
        VStack {
            VStack(spacing: -12) {
                HStack {
                    Text("50")
                        .font(.custom("Regular", size: 52))
                    Image(systemName: "wineglass")
                        .font(.custom("Regular", size: 32))
                }
                .foregroundStyle(Color(hex: 0xCBCBCB))
                .frame(width: UIScreen.screenWidth * 3 / 10, height:  UIScreen.screenHeight / 12)
                
                Text("SU BARDAGI")
                    .foregroundStyle(Color(hex: 0x747474))
            }
            .padding(.top, 32)
            
            Rectangle()
                .fill(Color.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .padding(.top, 16)
                
                
                
        }
    }
    
    var topNumber: some View {
        VStack(spacing: -12) {
            Text("1000")
                .frame(width: UIScreen.screenWidth * 3 / 10, height:  UIScreen.screenHeight / 12)
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
