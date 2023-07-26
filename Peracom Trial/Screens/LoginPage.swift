//
//  ContentView.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 21.07.2023.
//

import SwiftUI

struct LoginPage: View {
    
    @State private var textFieldInput : String = ""  // TEXTFIELD'a girilen değeri tutan değişken
    @State private var textFieldPassword : String = "" // SecureField'a girilen değeri tutan şifre değişkeni
    @State private var isShowingFirmPicker: Bool = false // Firma Picker'ını gösterip göstermeyeceğini anlayan boolean değişkeni
    @State private var isShowingTermPicker: Bool = false // Dönem Numarası Picker'ını gösterip göstermeyeceğini anlayan boolean değişkeni
    @State private var isOpen : Bool = false // Pickerların açık olmadadığını denetleyen boolean değişkeni
    
    var body: some View {
        
        VStack() {
            VStack(spacing: 20) {
                Image("logo")
                    .padding(.top,50)
                Spacer()
                VStack(spacing: 12) {
                    // Username TextField kodları ve Pickeklar açıkken tıklanırsa false döndürerek kapatan kodlar
                    CustomTextField(textFieldInput: textFieldInput, textFieldTitle: "Username" , cRadius: 6, strokeThickness: 2, iconName: "person.fill")
                        .onTapGesture {
                            isOpen = false
                            isShowingFirmPicker = false
                            isShowingTermPicker = false
                        }
                    // Password TextField kodları ve Pickeklar açıkken tıklanırsa false döndürerek kapatan kodlar
                    CustomSecureField(secureFieldInput: textFieldInput, secureFieldTitle: "Password", cRadius: 6, strokeThickness: 2, iconName: "lock.fill")
                        .onTapGesture {
                            isOpen = false
                            isShowingFirmPicker = false
                            isShowingTermPicker = false
                        }
                    // Firma Picker'ı, basıldığında eğer isOpen false ise CustomWheelPicker çalışır ve sonrasında isOpen değişkenini open yapar. Bunun haricinde Firmaları gösterip göstermeyeceğini anlamak için tıklanması gerekiyor bu yüzden toogle da oluyor.
                    CustomTextField(textFieldInput: textFieldInput, textFieldTitle: "Firm ID" , cRadius: 6, strokeThickness: 2, iconName: "house.fill")
                        .onTapGesture {
                            if isOpen == false{
                                isOpen = true
                                isShowingFirmPicker.toggle()
                            }
                        }
                    // Eğer uygun toogle değeri gelirse CustomWheelPicker'ı açıyor.
                    if isShowingFirmPicker {
                        CustomWheelPicker(isShowing: $isShowingFirmPicker, isOpen: $isOpen)
                    }
                    // Dönem Numarası Picker'ı, basıldığında eğer isOpen false ise CustomWheelPicker çalışır ve sonrasında isOpen değişkenini open yapar. Bunun haricinde Firmaları gösterip göstermeyeceğini anlamak için tıklanması gerekiyor bu yüzden toogle da oluyor.
                    CustomTextField(textFieldInput: textFieldInput, textFieldTitle: "Term Number", cRadius: 6, strokeThickness: 2, iconName: "calendar")
                        .onTapGesture {
                            if isOpen == false{
                                isOpen = true
                                isShowingTermPicker.toggle()
                            }
                        }
                    // Eğer uygun toogle değeri gelirse CustomWheelPicker'ı açıyor.
                    if isShowingTermPicker {
                        CustomWheelPicker(isShowing: $isShowingTermPicker, isOpen: $isOpen)
                    }
                    
                    //SIGN IN BUTONU
                    Button {
                        print("do login action")
                    } label: {
                        Text("Sign In")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(height: 52)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(6)
                    .padding()
                    Spacer()
                }
                .padding()
                
            }
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
