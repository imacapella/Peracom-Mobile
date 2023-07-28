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
        NavigationView{
            
            VStack{
                Image("logo")
                    .padding(.top, 57)
                    .onTapGesture {
                        print("calış")
                    }
                Spacer()
                ZStack{
                    VStack{
                        
                        HStack(spacing: 40){
                            HomeWidgets(widgetText: "Reports",iconName: "newspaper", action: {print("Reports View Geldi") }, nextView: Reports())
                                .padding()
                            HomeWidgets(widgetText: "Graphics",iconName: "chart.xyaxis.line", action: {print("Graphics View Geldi") }, nextView: Graphics())
                        }
                        HStack(spacing: 40){
                            HomeWidgets(widgetText: "Reports",iconName: "newspaper", action: {print("print") }, nextView: Reports())
                                .padding()
                            HomeWidgets(widgetText: "Reports",iconName: "newspaper", action: {print("print") }, nextView: Reports())
                        }
                        HStack(spacing: 40){
                            HomeWidgets(widgetText: "Reports",iconName: "newspaper", action: {print("print") }, nextView: Reports())
                                .padding()
                            HomeWidgets(widgetText: "Reports",iconName: "newspaper", action: {print("print") }, nextView: Reports())
                        }
                    } .padding(.trailing, 20)
                }
                
                Spacer()
                    
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
    struct HomePage_Previews: PreviewProvider {
        static var previews: some View {
            HomePage()
        }
    }
}
