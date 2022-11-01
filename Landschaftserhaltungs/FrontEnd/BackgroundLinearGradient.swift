//
//  BackgroundLinearGradient.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 29.10.22.
//

import Foundation
import SwiftUI
class BackGroundGradient
{
    public static func getGradient() -> LinearGradient{
        
        let gradient = Gradient(colors: [
            Color(hex: 0xFFFFFF),
            Color(hex: 0x7AE8A4),
            Color(hex: 0x21FF00)
        ])
        
        return LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
        
    }
}
