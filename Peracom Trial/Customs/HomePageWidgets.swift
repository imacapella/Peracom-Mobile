//
//  HomePageWidgets.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 24.07.2023.
//

import SwiftUI

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
                .foregroundStyle(.thinMaterial)
                .shadow(color: Color.black.opacity(0.3), radius: 3, x: -2, y: -2)
                .shadow(color: Color.white.opacity(0.7), radius: 3, x: 2, y: 2)
                .overlay(
                    VStack{
                        Image(systemName: iconName)
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(Color.black)
                        Text(widgetText)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                    }
                )
                .buttonStyle(PlainButtonStyle())
        }
    }
}

struct HomePageWidgets_Previews: PreviewProvider {
    static var previews: some View {
        HomeWidgets(widgetText: "Report", iconName: "house"){
            print("preview")
        }
    }
}
