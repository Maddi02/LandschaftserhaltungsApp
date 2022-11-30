//
//  PictureViewModel.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 23.11.22.
//

import Foundation
import SwiftUI
class pictureVM : ObservableObject
{
    
    
    
    @ObservedObject var userSettings = UserSettings()
    @Published var pictures : [partFieldArea] = [partFieldArea(picuture: UIImage()) ]
}
