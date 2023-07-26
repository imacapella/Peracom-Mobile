//
//  Reports.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 26.07.2023.
//

import SwiftUI

struct Reports: View {
    @State private var selectedTab : Tab = .house
    var body: some View {
        ZStack{
            VStack{
                Image("logo")
                    .padding(.top, 65)
                Spacer()
                RoundedRectangle(cornerRadius: 25)
                    .padding()
                    .padding(.top)
                    .foregroundColor((Color.gray).opacity(0.4))
                    .overlay{
                        VStack{
                            CustomLastReports()
                                .padding()
                            Divider().frame(width: 355)
                            CustomLastReports()
                                .padding()
                            CustomLastReports()
                                .padding()
                            Divider().frame(width: 355)
                            CustomLastReports()
                                .padding()
                            CustomLastReports()
                                .padding()
                            Divider().frame(width: 355)
                            CustomLastReports()
                                .padding()
                        }  
                    }
                Spacer()
                newReport()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Reports_Previews: PreviewProvider {
    static var previews: some View {
        Reports()
    }
}
