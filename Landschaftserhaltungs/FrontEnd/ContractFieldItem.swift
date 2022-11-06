//
//  ContractFieldItem.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI
struct ContractFieldItem
{
    enum TypeOfField{
        case meadow,other
    }
    
    var name:  String
    var dateOfTour: Date
    var fieldTyp : TypeOfField
    var countedPlants : Int
}

