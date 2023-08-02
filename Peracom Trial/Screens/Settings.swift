//
//  Settings.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 27.07.2023.
//

import SwiftUI

struct ToogleButton: View {
    var body: some View {
        Text("Sign in with Google")
            .foregroundColor(.white)
            .padding()
            .background(Color.red)
            .cornerRadius(8)
            .shadow(radius: 3)
    }
}

struct Settings: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isDarkMode = false

    var body: some View {
        ZStack {
            // Aydınlık arkaplan
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                Toggle("Dark Mode", isOn: $isDarkMode)
                    .padding()
                    .onChange(of: isDarkMode, perform: { value in
                        toggleDarkMode()
                    })
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light) // Dark mode veya light mode seçeneğine göre ayarla
    }

    private func toggleDarkMode() {
        UIApplication.shared.windows.forEach { window in
            if isDarkMode {
                window.overrideUserInterfaceStyle = .dark
            } else {
                window.overrideUserInterfaceStyle = .light
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
