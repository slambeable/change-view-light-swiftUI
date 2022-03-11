//
//  ContentView.swift
//  changeViewLightSwiftUI
//
//  Created by Андрей Евдокимов on 11.03.2022.
//

import SwiftUI

enum Field {
    case red
    case blue
    case green
}

struct ContentView: View {
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)
    
    @FocusState private var focusedField: Field?

    var body: some View {
        VStack {
            Color(cgColor: .init(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255, alpha: 1))
                .frame(height: 150)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 6))
                .padding(.vertical, 50)
            VStack(spacing: 20) {
                ColorController(value: $redValue, focusedField: _focusedField, colorOfSlider: .red, focusEqual: .red)
                ColorController(value: $blueValue, focusedField: _focusedField, colorOfSlider: .blue, focusEqual: .blue)
                ColorController(value: $greenValue, focusedField: _focusedField, colorOfSlider: .green, focusEqual: .green)
            }
            Spacer()
        }
        .padding()
        .ignoresSafeArea()
        .background(Color(uiColor: .init(red: 0.4, green: 0.2, blue: 1, alpha: 1)))
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    focusedField = nil
                }
            }
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
