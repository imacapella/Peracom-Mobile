//
//  ContentView.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 21.07.2023.
//

import SwiftUI

struct LoginPage: View {
    @State private var userFieldInput: String = ""
    @State private var secureFieldInput: String = ""
    @State private var firmFieldInput: String = ""
    @State private var termFieldInput: String = ""
    let colors = ["Red", "Green", "Blue", "Black", "Tartan"]
    let firms = ["Microsoft", "Peracom", "Apple", "Logo", "DELL"]
    let terms = ["1", "2", "3", "4", "5"]
    @State private var isShowingFirmPicker: Bool = false
    @State private var isShowingTermPicker: Bool = false
    @State private var isOpen: Bool = false
    @State private var shouldNavigateToHome = false
    @Binding var shouldShowTabBar: Bool
    @Binding var selectedTab: Tab
    @State private var isEditing: Bool = false

    // CustomTabBar'ı burada tanımlayın
    var customTabBar: some View {
        CustomTabBar(selectedTab: $selectedTab, visibleTabs: [.person, .house, .gearshape])
            .frame(height: 80)
            .padding(.bottom, 20)
            .opacity(shouldShowTabBar ? 1.0 : 0.0) // Tab bar'ın görünürlüğünü kontrol edin
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image("logo")
                    .padding(.top, 50)
                Spacer()
                NavigationLink(
                    destination: HomePage(),
                    isActive: $shouldNavigateToHome,
                    label: {
                        EmptyView()
                    }

                ).hidden()
                VStack(spacing: 12) {
                    CustomTextField(textFieldInput: $userFieldInput, textFieldTitle: "Username", cRadius: 6, strokeThickness: 2, iconName: "person.fill")
                        .onTapGesture {
                            isOpen = false
                            isShowingFirmPicker = false
                            isShowingTermPicker = false
                        }
                    CustomSecureField(secureFieldInput: $secureFieldInput, secureFieldTitle: "Password", cRadius: 6, strokeThickness: 2, iconName: "lock.fill")
                        .onTapGesture {
                            isOpen = false
                            isShowingFirmPicker = false
                            isShowingTermPicker = false
                        }

                    CustomTextField(textFieldInput: $firmFieldInput, textFieldTitle: "Firm ID", cRadius: 6, strokeThickness: 2, iconName: "house.fill")
                        .onTapGesture {
                            if isShowingFirmPicker == false {
                                isShowingFirmPicker.toggle()
                                isShowingTermPicker = false
                            }
                        }
                        .textFieldStyle(PlainTextFieldStyle())
                        

                    CustomTextField(textFieldInput: $termFieldInput, textFieldTitle: "Term Number", cRadius: 6, strokeThickness: 2, iconName: "calendar")
                        .onTapGesture {
                            if isShowingTermPicker == false {
                                isShowingTermPicker.toggle()
                                isShowingFirmPicker = false
                            }
                        }
                        .textFieldStyle(PlainTextFieldStyle())

                    if isShowingFirmPicker {
                        CustomFirmWheelPicker(selectionFirm: $firmFieldInput, isShowing: $isShowingFirmPicker, isOpen: $isOpen, items: firms)
                    }
                    if isShowingTermPicker {
                        CustomTermWheelPicker(selectionTerm: $termFieldInput, isShowing: $isShowingTermPicker, isOpen: $isOpen, items: terms)
                    }

                    Button {
                        if LoginControl(userAnswer: userFieldInput, passwordAnswer: secureFieldInput) {
                            shouldShowTabBar = true // Giriş başarılıysa TabBar'ı göster
                            shouldNavigateToHome = true // Diğer sayfaya yönlendir
                        }

                    } label: {
                        Text("Sign In")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .frame(height: 52)
                            .frame(maxWidth: .infinity)
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
            .navigationBarHidden(true) // Login sayfasında Navigation Bar'ı gizle
            .background(Color.white) // Login sayfasının arkaplanını beyaz yap
        }
    }
}

func LoginControl(userAnswer: String, passwordAnswer: String) -> Bool {
    let users: [String] = ["yilmazbey", "demo"]
    let passwords: [String] = ["yilmazbey", "demo"]

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




/* struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}*/
