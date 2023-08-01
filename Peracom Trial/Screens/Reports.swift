//
//  Reports.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 26.07.2023.
//

import SwiftUI

struct data : Identifiable {
    let id = UUID()
    let categoryName : String
    let categoryIcon : String
}

struct categories {
    static let categoriesArray = [data(categoryName: "Cari", categoryIcon: "person.fill"), data(categoryName: "Alış", categoryIcon: "cart.fill.badge.plus"), data(categoryName: "Satış", categoryIcon: "creditcard.fill")]
}

struct Reports: View {
    
    var cards : [data] = categories.categoriesArray
    @State private var selectedTab : Tab = .house
    var listIconName : String = "person.fill"
    var listTitle : String = "person"

    var body: some View {
        ZStack{
            Color.gray.opacity(0.1)
            VStack{
                Image("logo")
                    .padding()
                
                List(cards, id: \.id){ card in
                    NavigationLink(destination: ReportDetailView(category: card.categoryName), label: {
                        HStack{
                            Image(systemName: card.categoryIcon)
                            Text(card.categoryName)
                        }
                    })
                    
                }
                
                
                
                Spacer()
                newReport(text: "Yeni Rapor")
                    
            }.padding()
        }
    }
}


struct Reports_Previews: PreviewProvider {
    static var previews: some View {
        Reports()
    }
}
