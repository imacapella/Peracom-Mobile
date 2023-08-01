//
//  ReportDetailView.swift
//  Peracom Trial
//
//  Created by Gürkan Karadaş on 31.07.2023.
//

import SwiftUI

struct subCategory: Identifiable {
    let id = UUID()
    let subCategoryName: String
    let subCategoryItems: [subCategory]?    // Add any other properties relevant to your subcategories
}

struct subCategories {
    static let subCategories = [
        subCategory(
            subCategoryName: "Genel",
            subCategoryItems: [
                subCategory(subCategoryName: "Genel 1", subCategoryItems: nil),
                subCategory(subCategoryName: "Genel 2", subCategoryItems: nil),
                subCategory(subCategoryName: "Genel 3", subCategoryItems: nil)
            ]),
            subCategory(subCategoryName: "Bakiye Kontrol", subCategoryItems: [
                subCategory(subCategoryName: "Bakiye Kontrol 1", subCategoryItems: nil),
                subCategory(subCategoryName: "Bakiye Kontrol 2", subCategoryItems: nil),
                subCategory(subCategoryName: "Bakiye Kontrol 3", subCategoryItems: nil),
                ]
        )
    ]
}



struct ReportDetailView: View {
    let category: String // The selected category
    var subCards : [subCategory] = subCategories.subCategories

    var body: some View {
        VStack {
            Text("Selected Category: \(category)")
                .font(.title)
                .padding()
            
            // Use the selected category to retrieve the subcategories from the dictionary
            if subCards.isEmpty {
                            Text("No subcategories found for this category.")
            } else {
                List(subCards, children: \.subCategoryItems) { subCards in
                    HStack{
                        Image(systemName: "person.fill")
                        Text(subCards.subCategoryName)
                    }
                }
            }
            
            Spacer()
        }
        .navigationTitle("Subcategories")
    }
}

struct ReportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReportDetailView(category: "Blabla")
    }
}
