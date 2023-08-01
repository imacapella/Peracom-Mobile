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
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) { // TabView'ı selectedTab değişkeniyle bağlayın
                LoginPage()
                Graphics()
                    .tag(Tab.person)
                HomePage()
                    .tag(Tab.house) // Her sayfaya bir tag değeri verin
                Settings()
                    .tag(Tab.gearshape)
            }
             // TabView stilini düzenleyin
            .overlay(
                CustomTabBar(selectedTab: $selectedTab) // CustomTabBar'ı overlay olarak ekleyin ve selectedTab değişkenini bağlayın
                    .frame(height: 80)
                    .padding(.bottom, 20),
                alignment: .bottom
            ).edgesIgnoringSafeArea(.all)
            }
            
        }
    }


