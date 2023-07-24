//
//  CustomTextField.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 24.07.2023.
//

import SwiftUI

struct CustomTextField: View {
    @State public var textFieldInput : String = ""
    @State public var textFieldTitle : String = ""
    @State public var cRadius : CGFloat
    @State public var strokeThickness : CGFloat
    var body: some View {
        TextField(textFieldTitle, text: $textFieldInput)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: cRadius)
                    .strokeBorder(Color.black, lineWidth: strokeThickness))
  
    }
}

struct CustomSecureField: View {
    @State public var secureFieldInput : String = ""
    @State public var secureFieldTitle : String = ""
    @State public var cRadius : CGFloat
    @State public var strokeThickness : CGFloat
    var body: some View {
        SecureField(secureFieldTitle, text: $secureFieldInput)
            .padding()
            .background(RoundedRectangle(cornerRadius: cRadius)
                .strokeBorder(Color.black, lineWidth: strokeThickness))
  
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomSecureField(secureFieldInput: "bla", secureFieldTitle: "bla", cRadius: 10, strokeThickness: 1.5)
                .padding()
            CustomTextField(textFieldInput: "blabla", textFieldTitle: "blaaaa" ,cRadius: 10, strokeThickness: 1.5)
                .padding()
        }
    }
}
