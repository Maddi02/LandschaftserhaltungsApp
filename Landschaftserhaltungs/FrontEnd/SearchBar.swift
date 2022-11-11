//
//  SearchBar.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 11.11.22.
//
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
     var body: some View {
         ZStack {
             Rectangle()
                 .foregroundColor(Color("LightGray"))
             HStack {
                 Image(systemName: "magnifyingglass")
                 TextField("Search ..", text: $searchText)
             }
             .foregroundColor(.gray)
             .padding(.leading, 13)
         }
             .frame(height: 40)
             .cornerRadius(13)
             .padding()
     }
 }
