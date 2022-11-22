//
//  SectionIndexTitle.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 16.11.22.
//

import SwiftUI


struct SectionIndexTitle: View {
    let text: String
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
            .foregroundColor(Color.gray.opacity(0.1))
            .scaledToFit()
            .overlay(
                Text(text)
                    .foregroundColor(.blue)
            )
    }
}
