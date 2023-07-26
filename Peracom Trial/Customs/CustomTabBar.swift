//
//  CustomTabBar.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 24.07.2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case person
    case house
    case gearshape
}

struct CustomTabBar: View {
    
    @Binding var selectedTab :  Tab
    private var fillImage : String{
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack{
            HStack{
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage: tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(.black)
                        .font(.system(size: 22))
                        .onTapGesture{
                            withAnimation(.easeIn(duration: 0.1)){
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(20)
            .padding()
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}
