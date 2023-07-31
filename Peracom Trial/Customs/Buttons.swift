//
//  Buttons.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 26.07.2023.
//

import SwiftUI

struct newReport: View {
    var text : String = ""
    var body: some View {
        ZStack{
            Button {
                print("do login action")
            } label: {
                HStack {
                    Image(systemName: "plus")
                        .font(.system(size: 23))
                        .foregroundColor(.black)
                    Text(text)
                        .font(.title2)
                        .bold()
                    .foregroundColor(.black)
                }
            }
            .frame(height: 50)
            .frame(maxWidth: 300)
            .background((Color.gray).opacity(0.4))
            .cornerRadius(6)
            .padding()
            Spacer()
        }
        
    }
}

struct CustomLastReports: View {
    var body: some View {
        Button {
        } label: {
            HStack {
                Image(systemName: "doc.text.fill")
                    .foregroundColor(.black)
                Text("Last Report")
                        .bold()
                    .foregroundColor(.black)
                }
            .cornerRadius(6)
            .background{
                Rectangle()
                    .frame(width: 358, height: 40)
                    .foregroundColor(.gray.opacity(0.4))
            }
            }
    }
}


struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            newReport()
            CustomLastReports()
        }
    }
}
