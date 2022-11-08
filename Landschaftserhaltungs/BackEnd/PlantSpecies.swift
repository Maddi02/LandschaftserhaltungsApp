//
//  PlantSpecies.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 07.11.22.
//

import Foundation


class PlantSpecies : Identifiable, ObservableObject

{
    public var scientificName : String = " "
    public var redListBw : Character = " "
    public var responsibility : Character = " "
    public var oberReihnArea : Character = " "
    public var blackForest : Character = " "
    public var odenWald : Character = " "
    public var nothernGaelandschaften : Character = " "
    public var southernGaelandschaften : Character = " "
    public var schaebischeAlb : Character = " "
    public var alpenvorland : Character = " "
    public var germanName : String = " "
    @Published public var isChecked : Bool = false
  
    
    
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





