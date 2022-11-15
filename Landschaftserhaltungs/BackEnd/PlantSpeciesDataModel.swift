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
  //  @Published var sectionDictionary : Dictionary<String , [PlantSpecies]>
    @Published var checklistItems = [
      CheckListItem(name: "Walk the dog"),
      CheckListItem(name: "Brush my teeth"),
      CheckListItem(name: "Learn iOS development", isChecked: true),
      CheckListItem(name: "Soccer practice"),
      CheckListItem(name: "Eat ice cream", isChecked: true),
    ]

    

    
    init()
    {

      //  sectionDictionary = [:]
      //  sectionDictionary = getSectionedDictionary()
        
     
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
            scientificName: "C",
            redListBw: "*",
            responsibility: " ",
            oberReihnArea: "*",
            blackForest: "*",
            odenWald: "*",
            nothernGaelandschaften: "*",
            southernGaelandschaften: "*",
            schaebischeAlb: "*",
            alpenvorland: "*",
            germanName: "C"
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
        platList.append(PlantSpecies(
            scientificName: "B",
            redListBw: "*",
            responsibility: " ",
            oberReihnArea: "*",
            blackForest: "-",
            odenWald: "°",
            nothernGaelandschaften: "°",
            southernGaelandschaften: "°",
            schaebischeAlb: "°",
            alpenvorland: "°",
            germanName: "B"
        ))
        platList.append(PlantSpecies(
            scientificName: "A",
            redListBw: "*",
            responsibility: " ",
            oberReihnArea: "*",
            blackForest: "-",
            odenWald: "°",
            nothernGaelandschaften: "°",
            southernGaelandschaften: "°",
            schaebischeAlb: "°",
            alpenvorland: "°",
            germanName: "A"
        ))
        
   
    }
    
    
    
    
     var plat : [PlantSpecies]
    {
        
        
       
        return platList
    }
    
    
    func getSectionedDictionary() -> Dictionary <String , [PlantSpecies]> {
        let sectionDictionary: Dictionary<String, [PlantSpecies]> = {
            return Dictionary(grouping: platList, by: {
                let name = $0.germanName
                let normalizedName = name.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
                let firstChar = String(normalizedName.first!).uppercased()
                return firstChar
            })
        }()
        return sectionDictionary
    }
    
    
    
}
