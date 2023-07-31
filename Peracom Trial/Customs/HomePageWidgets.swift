//
//  HomePageWidgets.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 24.07.2023.
//

import SwiftUI

struct HomeWidgets<TargetView: View>: View {
    var widgetText: String
    var iconName: String
    var action: () -> Void
    var nextView: TargetView
    
    @State private var isAnimating: Bool = false // Tıklanma durumunu izleyen @State
    
    var body: some View {
        // Button'ın içindeki animasyon, tıklanma durumuna göre değişecek
        Button(action: {
            isAnimating = true // Butona basıldığında animasyonu başlat
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {}
            action() // Butona basıldığında yapılacak işlemi gerçekleştir
        }) {
            RoundedRectangle(cornerRadius: 11)
                .frame(width: 90, height: 90)
                .foregroundStyle(.thinMaterial)
                .shadow(color: Color.black.opacity(0.3), radius: 3, x: -2, y: -2)
                .shadow(color: Color.white.opacity(0.7), radius: 3, x: 2, y: 2)
                .overlay(
                    VStack {
                        Image(systemName: iconName)
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(Color.black)
                        Text(widgetText)
                    }
                )
        }
        .buttonStyle(PlainButtonStyle())
        // Arka plana yatayda dolduran NavigationLink ekleyin, tıklanılabilirliği sağlayacak
        .background(NavigationLink(destination: nextView, isActive: $isAnimating) {
            EmptyView()
        })
    }
}

struct HomePageWidgets_Previews: PreviewProvider {
    static var previews: some View {
        HomeWidgets(widgetText: "Reports",iconName: "newspaper", action: {print("bla")}, nextView: Reports())
    }
}
