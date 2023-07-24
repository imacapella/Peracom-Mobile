//
//  ContentView.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 21.07.2023.
//

import SwiftUI

struct LoginPage: View {
    
    @State private var textFieldUser : String = ""
    @State private var textFieldPassword : String = ""
    
    var body: some View {
        
        VStack() {
            VStack(spacing: 100) {
                Image("logo")
                Text("Welcome!")
                    .font(Font.system(size: 40))
                .fontWeight(.bold) }
            VStack(spacing: 12) {
                CustomTextField(textFieldInput: textFieldUser, textFieldTitle: "Username" , cRadius: 6, strokeThickness: 2)
                CustomTextField(textFieldInput: textFieldPassword, textFieldTitle: "Password", cRadius: 6, strokeThickness: 2)
                CustomTextField(textFieldInput: textFieldUser, textFieldTitle: "Firm ID" , cRadius: 6, strokeThickness: 2)
                CustomTextField(textFieldInput: textFieldPassword, textFieldTitle: "Term Number", cRadius: 6, strokeThickness: 2)
            }
            .padding(.bottom,20)
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
            }
            .padding()
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            LoginPage()
        }
    }

