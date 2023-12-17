//
//  CustomSliderView.swift
//  ThreeSlidersSUI
//
//  Created by Roman on 17.12.23.
//

import SwiftUI

struct CustomSliderView: View {
    @Binding var sliderValueRed: Double
    @Binding var sliderValueGreen: Double
    @Binding var sliderValueBlue: Double
    
    @Binding var redTextField: String
    @Binding var greenTextField: String
    @Binding var blueTextField: String
    
    var body: some View {
        VStack {
            ColorSlider(value: $sliderValueRed, text: $redTextField, color: .red)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Go!") {
                            sliderValueRed = Double(redTextField) ?? 0
                            sliderValueGreen = Double(greenTextField) ?? 0
                            sliderValueBlue = Double(blueTextField) ?? 0
                        }
                    }
                }
            ColorSlider(value: $sliderValueGreen, text: $greenTextField, color: .green)
            ColorSlider(value: $sliderValueBlue, text: $blueTextField, color: .cyan)
        }
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    @Binding var text: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 5) {
            Text("\(Int(value))")
                .frame(width: 50)
            Slider(value: $value, in: 0...255)
                .accentColor(color)
                .frame(width: 280)
                .onChange(of: value) { text = "\(Int(value))" }
            TextField("", text: $text)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .padding(.trailing)
        }
    }
}

#Preview {
    ContentView()
}
