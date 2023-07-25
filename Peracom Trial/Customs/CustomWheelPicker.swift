//
//  CustomWheelPicker.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 25.07.2023.
//

import SwiftUI

struct CustomWheelPicker: View {
    @State private var selection = ""
    @Binding var isShowing : Bool
    @Binding var isOpen : Bool
        let colors = ["Red", "Green", "Blue", "Black", "Tartan"]

        var body: some View {
            if isShowing {
                VStack {
                    Spacer()
                    VStack {
                        Picker("Select a paint color", selection: $selection) {
                            ForEach(colors, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.wheel)
                        Button("Done") {
                            isOpen = true
                            isShowing = false // "Done" butonuna tıklandığında isShowing'i false yaparak picker'ı kapatın
                        }
                        .padding(.top, 10)
                    }.background(RoundedRectangle(cornerRadius: 10)
                        .edgesIgnoringSafeArea(.all)
                        .background(.ultraThinMaterial)
                        .opacity(0.1)
                    )
                    .padding()
                }.animation(.easeInOut)
            }
        }
}

struct CustomWheelPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomWheelPicker(isShowing: .constant(true), isOpen: .constant(true))
    }
}
