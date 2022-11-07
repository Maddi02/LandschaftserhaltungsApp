//
//  PlantSpecies.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 07.11.22.
//

import Foundation


class PlantSpecies

{
    private var scientificName : String = " "
    private var redListBw : Character = " "
    private var responsibility : Character = " "
    private var oberReihnArea : Character = " "
    private var blackForest : Character = " "
    private var odenWald : Character = " "
    private var nothernGaelandschaften : Character = " "
    private var southernGaelandschaften : Character = " "
    private var schaebischeAlb : Character = " "
    private var alpenvorland : Character = " "
    private var germanName : String = " "
    
    
    init(scientificName: String,
         redListBw : Character,
         responsibility : Character,
         oberReihnArea : Character,
         blackForest : Character,
         odenWald : Character,
         nothernGaelandschaften : Character,
         southernGaelandschaften : Character,
         schaebischeAlb : Character,
         alpenvorland : Character,
         germanName : String)
    {
        self.scientificName = scientificName
        self.redListBw = redListBw
        self.oberReihnArea = oberReihnArea
        self.blackForest = blackForest
        self.nothernGaelandschaften = nothernGaelandschaften
        self.southernGaelandschaften = southernGaelandschaften
        self.schaebischeAlb = schaebischeAlb
        self.alpenvorland = alpenvorland
        self.germanName = germanName
    }
    
    
}






