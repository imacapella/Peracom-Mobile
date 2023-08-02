//
//  Peracom_TrialApp.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 21.07.2023.
//
import SwiftUI

@main
struct Peracom_TrialApp: App {
    @State private var selectedTab: Tab = .none
    @State private var shouldShowTabBar = false // Yeni @State değişkeni

    var body: some Scene {
        WindowGroup {
            if shouldShowTabBar {
                // Eğer giriş başarılı olduysa TabBar ve diğer sayfaları göster
                TabView(selection: $selectedTab) { // TabView'ı selectedTab değişkeniyle bağlayın
                    Graphics()
                        .tag(Tab.person)
                        .preferredColorScheme(.light)
                    HomePage()
                        .tag(Tab.house)
                        .preferredColorScheme(.light)// Her sayfaya bir tag değeri verin
                    Settings()
                        .tag(Tab.gearshape)
                        .preferredColorScheme(.light)
                }
                // TabView stilini düzenleyin
                .overlay(
                    CustomTabBar(selectedTab: $selectedTab) // CustomTabBar'ı overlay olarak ekleyin ve selectedTab değişkenini bağlayın
                        .frame(height: 80)
                        .padding(.bottom, 20),
                    alignment: .bottom
                )
                .edgesIgnoringSafeArea(.all)
            } else {
                // Eğer giriş başarılı olmadıysa sadece LoginPage'i göster
                LoginPage(shouldShowTabBar: $shouldShowTabBar, selectedTab: $selectedTab)
                    .preferredColorScheme(.light)
                    .onAppear {
                        shouldShowTabBar = false // Login sayfasına geri dönüldüğünde TabBar'ı gizle
                    }
            }
        }
    }
}



