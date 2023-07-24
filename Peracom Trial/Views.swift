//
//  Views.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 21.07.2023.
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

struct Views_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(textFieldTitle: "selam", cRadius: 8, strokeThickness: 1.5)
    }
}

struct HomeWidgets: View {
    var  widgetText : String = ""
    var  iconName : String = ""
    var action: () -> Void
    
    init(widgetText: String, iconName: String, action: @escaping () -> Void) {
            self.widgetText = widgetText
            self.iconName = iconName
            self.action = action
        }
    
    var body: some View {
        Button(action: action){
            RoundedRectangle(cornerRadius: 11)
                .frame(width: 90, height: 90)
                .foregroundColor(.gray)
                .shadow(color: Color.black.opacity(0.3), radius: 3, x: -2, y: -2)
                .shadow(color: Color.white.opacity(0.7), radius: 3, x: 2, y: 2)
                .overlay(
                    VStack{
                        Image(systemName: iconName)
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(Color(red: 178/255, green: 34/255, blue: 34/255))
                        Text(widgetText)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 178/255, green: 34/255, blue: 34/255))
                    }
                )
                .buttonStyle(PlainButtonStyle())
        }
    }
}

struct HomeBottomNavBar: View {
    @State private var selectedTab = 0 // Seçilen sekmenin indeksi

    var body: some View {
        TabView(selection: $selectedTab) {
            // İlk sekme içeriği
            VStack {
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Home")
            }
            .tag(0)

            // İkinci sekme içeriği
            VStack {
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Notifications")
            }
            .tag(1)

            // Üçüncü sekme içeriği
            VStack {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Profile")
            }
            .tag(2)
        }
        .tabViewStyle(DefaultTabViewStyle()) // Bottom navigation bar stili (opsiyonel)
    }
}


struct Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(cRadius: 6, strokeThickness: 1.5)
            .padding()
    }
}

