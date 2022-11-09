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
    public var redListBw : String = " "
    public var responsibility : String = " "
    public var oberReihnArea : String = " "
    public var blackForest : String = " "
    public var odenWald : String = " "
    public var nothernGaelandschaften : String = " "
    public var southernGaelandschaften : String = " "
    public var schaebischeAlb : String = " "
    public var alpenvorland : String = " "
    public var germanName : String = " "
    @Published public var isChecked : Bool = false
  
    
    
    init(scientificName: String,
         redListBw : String,
         responsibility : String,
         oberReihnArea : String,
         blackForest : String,
         odenWald : String,
         nothernGaelandschaften : String,
         southernGaelandschaften : String,
         schaebischeAlb : String,
         alpenvorland : String,
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





