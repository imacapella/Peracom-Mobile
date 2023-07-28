//
//  Peracom_TrialApp.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 21.07.2023.
//

import SwiftUI

@main
struct Peracom_TrialApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                LoginPage()
                
                    HomePage()
                        .tabItem {
                            HStack{
                                Text("Home")
                                Image(systemName: "house.fill")
                            }
                    }
                }
            }
        }

            }
