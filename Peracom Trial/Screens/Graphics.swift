//
//  Graphics.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 27.07.2023.
//

import SwiftUI

struct Graphics: View {
    var body: some View {
        VStack {
            Spacer()
            newReport(text: "Choose Report")
                
        }.padding()
    }
}

struct Graphics_Previews: PreviewProvider {
    static var previews: some View {
        Graphics()
    }
}
