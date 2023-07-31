//
//  ContentView.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 21.07.2023.
//

import SwiftUI

struct LoginPage: View {
    
    @State private var userFieldInput : String = ""  // TEXTFIELD'a girilen değeri tutan değişken
    @State private var secureFieldInput : String = "" // SecureField'a girilen değeri tutan şifre değişkeni
    @State private var firmFieldInput : String = ""
    @State private var termFieldInput : String = ""
    let colors = ["Red", "Green", "Blue", "Black", "Tartan"]
    let firms = ["Microsoft", "Peracom", "Apple", "Logo", "DELL"]
    let terms = ["1", "2", "3", "4", "5"]
    @State private var isShowingFirmPicker: Bool = false // Firma Picker'ını gösterip göstermeyeceğini anlayan boolean değişkeni
    @State private var isShowingTermPicker: Bool = false // Dönem Numarası Picker'ını gösterip göstermeyeceğini anlayan boolean değişkeni
    @State private var isOpen : Bool = false // Pickerların açık olmadadığını denetleyen boolean değişkeni
    @State private var shouldNavigateToHome = false
    
    var body: some View {
        
        NavigationView{
            VStack(spacing: 20) {
                Image("logo")
                    .padding(.top,50)
                Spacer()
                NavigationLink(
                    destination: HomePage(),
                    isActive: $shouldNavigateToHome,
                    label: {
                        EmptyView()
                    }
                    
                ).hidden()
                VStack(spacing: 12) {
                    // Username TextField kodları ve Pickeklar açıkken tıklanırsa false döndürerek kapatan kodlar
                    CustomTextField(textFieldInput: $userFieldInput, textFieldTitle: "Username" , cRadius: 6, strokeThickness: 2, iconName: "person.fill")
                        .onTapGesture {
                            isOpen = false
                            isShowingFirmPicker = false
                            isShowingTermPicker = false
                        }
                    // Password TextField kodları ve Pickeklar açıkken tıklanırsa false döndürerek kapatan kodlar
                    CustomSecureField(secureFieldInput: $secureFieldInput, secureFieldTitle: "Password", cRadius: 6, strokeThickness: 2, iconName: "lock.fill")
                        .onTapGesture {
                            isOpen = false
                            isShowingFirmPicker = false
                            isShowingTermPicker = false
                        }
//-------------------FIRM-------------------------------------------------------------------------------------------------
                    // Firma Picker'ı, basıldığında eğer isOpen false ise CustomWheelPicker çalışır ve sonrasında isOpen değişkenini open yapar. Bunun haricinde Firmaları gösterip göstermeyeceğini anlamak için tıklanması gerekiyor bu yüzden toogle da oluyor.
                    CustomTextField(textFieldInput: $firmFieldInput, textFieldTitle: "Firm ID" , cRadius: 6, strokeThickness: 2, iconName: "house.fill")
                        .onTapGesture {
                            if isShowingFirmPicker == false{
                                isShowingFirmPicker.toggle()
                                isShowingTermPicker = false
                            }
                        }
                    // Eğer uygun toogle değeri gelirse CustomWheelPicker'ı açıyor.
                    
//-------------------TERM-------------------------------------------------------------------------------------------------
                    // Dönem Numarası Picker'ı, basıldığında eğer isOpen false ise CustomWheelPicker çalışır ve sonrasında isOpen değişkenini open yapar. Bunun haricinde Firmaları gösterip göstermeyeceğini anlamak için tıklanması gerekiyor bu yüzden toogle da oluyor.
                    CustomTextField(textFieldInput: $termFieldInput, textFieldTitle: "Term Number", cRadius: 6, strokeThickness: 2, iconName: "calendar")
                        .onTapGesture {
                            if isShowingTermPicker == false{
                                isShowingTermPicker.toggle()
                                isShowingFirmPicker = false
                            }
                        }
//-------------------PICKERS-------------------------------------------------------------------------------------------------
                    // Eğer uygun toogle değeri gelirse CustomWheelPicker'ı açıyor.
                    if isShowingFirmPicker {
                        CustomFirmWheelPicker(selectionFirm: $firmFieldInput, isShowing: $isShowingFirmPicker, isOpen: $isOpen, items: firms)
                    }
                    if isShowingTermPicker {
                        CustomTermWheelPicker(selectionTerm: $termFieldInput, isShowing: $isShowingTermPicker, isOpen: $isOpen, items: terms)
                    }
                    
//-------------------SIGN IN-------------------------------------------------------------------------------------------------
                    
                    Button {
                        print(userFieldInput + " " + secureFieldInput)
                        //--------- KONTROL VE DİĞER SAYFAYA AKTAR MEKANİZMASI--------------
                        if LoginControl(userAnswer: userFieldInput, passwordAnswer: secureFieldInput){
                            shouldNavigateToHome = true
                        }
                        
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

func LoginControl(userAnswer: String, passwordAnswer: String) -> Bool {
    let users: [String] = ["yilmaz", "demo"]
    let passwords: [String] = ["yilmaz", "demo"]
    
    if let userIndex = users.firstIndex(of: userAnswer) {
        if passwordAnswer == passwords[userIndex] {
            print("Successful login")
            return true
        } else {
            print("Invalid password")
        }
    } else {
        print("Invalid username")
    }
    
    return false
}



struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
