//
//  PlantListItem.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 29.11.22.
//

import Foundation

struct PlantListItem : Identifiable
{
    
    private var scientficName : String
    private var germanName : String
    private var evaluation1a : String
    private var evaluation1b : String
    private var evaluation1c : String
    private var evaluation1d : String
    private var evaluation2 : String
    private var evaluation3 : String
    private var evaluationRL : String
    var id = UUID()
    
    init(row: [String])
    {
        scientficName = row[0]
        germanName = row[1]
        evaluation1a = row[2]
        evaluation1b = row[3]
        evaluation1c = row[4]
        evaluation1d = row[5]
        evaluation2 = row[6]
        evaluation3 = row[7]
        evaluationRL = row[8]
    }
    
    
    
    
}
