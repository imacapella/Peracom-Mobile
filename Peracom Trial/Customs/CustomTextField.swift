//
//  CustomTextField.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 24.07.2023.
//

import SwiftUI

struct CustomTextField: View {
    @Binding public var textFieldInput : String
    @State public var textFieldTitle : String = ""
    @State public var cRadius : CGFloat
    @State public var strokeThickness : CGFloat
    var iconName : String = ""
    var body: some View {
        ZStack(alignment: .leading) {
                   RoundedRectangle(cornerRadius: cRadius)
                       .strokeBorder(Color.black, lineWidth: strokeThickness)
                       .frame(width: .infinity, height: 45)

                   HStack {
                       Image(systemName: iconName)
                           .foregroundColor(.gray)
                           .padding(.leading, 12)

                       TextField(textFieldTitle, text: $textFieldInput)
                           .padding(.trailing, 12) // Metni sağa doğru boşluk ekleyin
                           .textInputAutocapitalization(.never)
                   }
               }
               .padding(.horizontal, 25)
    }
}

struct CustomSecureField: View {
    @Binding public var secureFieldInput : String
    @State public var secureFieldTitle : String = ""
    @State private var clearBool : Bool?
    @State public var cRadius : CGFloat
    @State public var strokeThickness : CGFloat
    var iconName : String = ""
    
    
    var body: some View {
        ZStack(alignment: .leading) {
                   RoundedRectangle(cornerRadius: cRadius)
                       .strokeBorder(Color.black, lineWidth: strokeThickness)
                       .frame(width: .infinity, height: 50)

                   HStack {
                       Image(systemName: iconName)
                           .foregroundColor(.gray)
                           .padding(.leading, 12)

                       SecureField("Password", text: $secureFieldInput)
                           .padding(.trailing, 12) // Metni sağa doğru boşluk ekleyin
                       .textInputAutocapitalization(.never)                   }
               }
               .padding(.horizontal, 25)
    }
}

/* struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomSecureField(secureFieldInput: "bla", secureFieldTitle: "bla", cRadius: 10, strokeThickness: 1)
                .padding()
            CustomTextField(textFieldInput: "blabla", textFieldTitle: "blaaaa" ,cRadius: 10, strokeThickness: 1.5)
                .padding()
            //CustomWheelPicker()
        }
    }
} */
