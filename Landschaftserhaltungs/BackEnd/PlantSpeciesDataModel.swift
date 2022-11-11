//
//  PlantSpeciesDataModel.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 07.11.22.
//

import Foundation

public class PlantSpeciesDataModel : ObservableObject

{
    
    
    
    
    
     @Published var platList : [PlantSpecies] = []
     @Published var filterdPlants : [PlantSpecies] = []
    @Published var checklistItems = [
      CheckListItem(name: "Walk the dog"),
      CheckListItem(name: "Brush my teeth"),
      CheckListItem(name: "Learn iOS development", isChecked: true),
      CheckListItem(name: "Soccer practice"),
      CheckListItem(name: "Eat ice cream", isChecked: true),
    ]

    

    
    init()
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


    }
    
     func geti() -> [PlantSpecies]
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
    
    
    
    
     var plat : [PlantSpecies]
    {
        
        
       
        return platList
    }
    
    
    
    
    
    
}
