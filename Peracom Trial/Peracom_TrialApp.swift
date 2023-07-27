//
//  Peracom_TrialApp.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 21.07.2023.
//

import SwiftUI

@main
struct Peracom_TrialApp: App {
    @State var loginPageTrigger = true
    @State var homePageTrigger = false
    var body: some Scene {
        WindowGroup {
            HomePage()
        }
    }
}
