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
    @Published var pictures : [partFieldArea] = [partFieldArea(picuture: UIImage()) ]
}
