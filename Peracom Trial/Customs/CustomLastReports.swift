//
//  CustomLastReports.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 26.07.2023.
//

import SwiftUI

struct CustomLastReports: View {
    var body: some View {
        Button {
        } label: {
            HStack {
                Image(systemName: "doc.text.fill")
                Text("Last Report")
                        .bold()
                    .foregroundColor(.black)
                }
            .cornerRadius(6)
            }
    }
}

struct CustomLastReports_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Section{
                CustomLastReports()
                Divider()
                CustomLastReports()
                Divider()
                CustomLastReports()
            }
        }
    }
}
