//
//  ContentView.swift
//  ThreeSlidersSUI
//
//  Created by Roman on 16.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValueRed = Double.random(in: 1...255)
    @State private var sliderValueGreen = Double.random(in: 1...255)
    @State private var sliderValueBlue = Double.random(in: 1...255)
    
    @State private var redValueLabel = ""
    @State private var greenValueLabel = ""
    @State private var blueValueLabel = ""
    
    
    @State private var viewColor = Color(red: 0, green: 0, blue: 0)
    
    var body: some View {
        ZStack(alignment: .top){
            Color(Color.blue).ignoresSafeArea()
            VStack(spacing: 80) {
                CustomView(mainViewColor: $viewColor)
                    .onAppear {
                        updateViewColor()
                    }
                CustomSliderView(sliderValueRed: $sliderValueRed,
                                 sliderValueGreen: $sliderValueGreen,
                                 sliderValueBlue: $sliderValueBlue,
                                 
                                 redTextField: $redValueLabel,
                                 greenTextField: $greenValueLabel,
                                 blueTextField: $blueValueLabel
                )
                .onChange(of: sliderValueRed) { updateViewColor() }
                .onChange(of: sliderValueGreen) { updateViewColor() }
                .onChange(of: sliderValueBlue) { updateViewColor() }
            }
        }
    }
    
    private func updateViewColor() {
        viewColor = Color(
            red: sliderValueRed / 255.0,
            green: sliderValueGreen / 255.0,
            blue: sliderValueBlue / 255.0
        )
    }

}

#Preview {
    ContentView()
}
