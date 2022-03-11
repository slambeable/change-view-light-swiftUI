//
//  ColorController.swift
//  changeViewLightSwiftUI
//
//  Created by Андрей Евдокимов on 11.03.2022.
//

import SwiftUI

struct ColorController: View {
    @Binding var value: Double
    @FocusState var focusedField: Field?
    let colorOfSlider: Color
    let focusEqual: Field

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }()

    var body: some View {
        HStack(spacing: 20) {
            Text("\(lround(value))")
                .fontWeight(.bold)
                .frame(width: 35)
                .foregroundColor(.white)
            Slider(value: $value, in: 0...255)
                .accentColor(colorOfSlider)
                .frame(maxWidth: .infinity)
            TextField("Enter", value: $value, formatter: formatter, onEditingChanged: onEditingChanged)
                .font(.system(size: 16, weight: .bold))
                .frame(width: 50)
                .foregroundColor(.black)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .focused($focusedField, equals: focusEqual)
        }
    }
    
    private func onEditingChanged(isBegin: Bool) {
        if (!isBegin) {
            if (value < 0) {
                value = 0
            } else if (value > 255) {
                value = 255
            }
        }
    }
}

struct ColorController_Previews: PreviewProvider {
    static var previews: some View {
        @State var redValue = Double.random(in: 0...255)
        @FocusState var focusedField: Field?
        
        return ColorController(value: $redValue, focusedField: _focusedField, colorOfSlider: .red, focusEqual: .red)
    }
}
