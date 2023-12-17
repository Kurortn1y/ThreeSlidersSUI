//
//  CustomView.swift
//  ThreeSlidersSUI
//
//  Created by Roman on 17.12.23.
//

import SwiftUI

struct CustomView: View {
    @Binding var mainViewColor: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(mainViewColor)
            .frame(width: 350, height: 150)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 3)
            )
    }
}
