//
//  HomePage.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 21.07.2023.
//

import SwiftUI

struct HomePage: View {
    @State private var selectedTab : Tab = .house
    var body: some View{
            VStack{
                Image("logo")
                    .padding(.top, 65)
                    .onTapGesture {
                        print("calış")
                    }
                Spacer()
                ZStack{
                    VStack{
                        HStack(spacing: 40){
                            HomeWidgets(widgetText: "Report", iconName: "newspaper") {
                                print("sleam")
                            }
                            .padding()
                            HomeWidgets(widgetText: "Print", iconName: "printer") {
                                print("sleam")
                            }
                        }
                        HStack(spacing: 40){
                            HomeWidgets(widgetText: "Graphics", iconName: "chart.xyaxis.line") {
                                print("sleam")
                            }
                            .padding()
                            HomeWidgets(widgetText: "Tasks", iconName: "list.clipboard") {
                                print("sleam")
                            }
                        }
                        HStack(spacing: 40){
                            HomeWidgets(widgetText: "Profile", iconName: "person.crop.circle") {
                                print("sleam")
                            }
                            .padding()
                            HomeWidgets(widgetText: "help", iconName: "questionmark.circle") {
                                print("sleam")
                            }
                        }
                    } .padding(.trailing, 20)
                }
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
            .edgesIgnoringSafeArea(.all)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
