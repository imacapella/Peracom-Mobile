//
//  CustomWheelPicker.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 25.07.2023.
//

import SwiftUI

struct CustomWheelPicker: View {
    @Binding var selection : String
    @Binding var isShowing : Bool
    @Binding var isOpen : Bool
    let items : [String]

        var body: some View {
            if isShowing {
                VStack {
                    Spacer()
                    VStack {
                        Picker("Select a paint color", selection: $selection) {
                            ForEach(items, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.wheel)
                        .animation(.easeInOut)
                        Button("Done") {
                            isOpen = false
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

/*struct CustomWheelPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomWheelPicker(selection: ,isShowing: .constant(true), isOpen: .constant(true))
    }
}*/
