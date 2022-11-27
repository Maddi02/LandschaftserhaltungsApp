//
//  ToggleCheckboxStyle.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI

struct ToggleCheckboxStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(systemName: "checkmark.square").symbolVariant(configuration.isOn ? .fill : .none).symbolVariant(configuration.isOn ? .fill : .none)
        }

    }
 
}

extension ToggleStyle where Self == ToggleCheckboxStyle {
    static var checklist: ToggleCheckboxStyle { .init()}
}


