//
//  PlantSpeciesDataModel.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 07.11.22.
//

import Foundation

public class PlantSpeciesDataModel

{
     var platList : [PlantSpecies] = []
    
     var plat : [PlantSpecies]
    {
        
        
        platList.append(PlantSpecies(
            scientificName: "Abies alba",
            redListBw: "*",
            responsibility: " ",
            oberReihnArea: "*",
            blackForest: "*",
            odenWald: "°",
            nothernGaelandschaften: "V",
            southernGaelandschaften: "*",
            schaebischeAlb: "*",
            alpenvorland: "*",
            germanName: "Weiß-Tanne"
        ))
        
        platList.append(PlantSpecies(
            scientificName: "Acer campestre",
            redListBw: "*",
            responsibility: " ",
            oberReihnArea: "*",
            blackForest: "*",
            odenWald: "*",
            nothernGaelandschaften: "*",
            southernGaelandschaften: "*",
            schaebischeAlb: "*",
            alpenvorland: "*",
            germanName: "Feld-Ahorn"
        ))
        
        platList.append(PlantSpecies(
            scientificName: "Acer negundo",
            redListBw: "*",
            responsibility: " ",
            oberReihnArea: "*",
            blackForest: "-",
            odenWald: "°",
            nothernGaelandschaften: "°",
            southernGaelandschaften: "°",
            schaebischeAlb: "°",
            alpenvorland: "°",
            germanName: "Eschen-Ahorn"
        ))
        
        
        
        
        
        return platList
    }
    
    
    
    
    
}
