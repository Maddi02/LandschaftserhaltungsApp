//
//  PlantSpeciesDataModel.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 07.11.22.
//

import Foundation
import SwiftUI
public class PlantSpeciesDataModel : ObservableObject

{
    
    
    
    
    let defaults = UserDefaults.standard
    @Published var platList : [PlantSpecies] = []
    @Published var showAlert : Bool = false
    @Published var filterdPlants : [PlantSpecies] = []
    @Published  var germanList:  [String:  [PlantSpecies]] = [:]
    @Published  var lateinList:  [String:  [PlantSpecies]] = [:]
    @Published private var ItemCheckTrue : Bool = true
    let alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    
    
    

    
    func hell(plantName : String, state : Bool)
    {
        print(plantName)
        for (_ , plant) in germanList{
            
            for i in plant
            {
                if (i.germanName == plantName)
                {
                 //   i.$isChecked = ItemCheckTrue
                }

            }
        }
    }

    
    

    
        
    
    init()
    {

      //  sectionDictionary = [:]
      //  sectionDictionary = getSectionedDictionary()
    
    
        loadFromCSV()
        initatializeList()


        }
   
   
    
   
    
    func b() -> [String: [PlantSpecies]]
    {
        return germanList
    }
    
    func getLateinList() -> [String: [PlantSpecies]]
    {
        return lateinList
    }
    
    
    func setItemCheckedState(plant : String)
    {
        
        for (_, numbers) in germanList
        {
            for i in numbers{
                if(i.germanName == plant)
                {
                    i.isChecked = true
                }
            }
         
        }
        
        
    }
    
    
    
    
    func initatializeList()
    {
        print("IN A")

        print(platList.count)
        germanList  =
        

            [
                
                "A" :  platList.filter { $0.germanName[0] == "A"},
                "B" :  platList.filter { $0.germanName[0] == "B"},
                "C" :  platList.filter { $0.germanName[0] == "C"},
                "D" :  platList.filter { $0.germanName[0] == "D"},
                "E" :  platList.filter { $0.germanName[0] == "E"},
                "F" :  platList.filter { $0.germanName[0] == "F"},
                "G" :  platList.filter { $0.germanName[0] == "G"},
                "H" :  platList.filter { $0.germanName[0] == "H"},
                "I" :  platList.filter { $0.germanName[0] == "I"},
                "J" :  platList.filter { $0.germanName[0] == "J"},
                "K" :  platList.filter { $0.germanName[0] == "K"},
                "L" :  platList.filter { $0.germanName[0] == "L"},
                "M" :  platList.filter { $0.germanName[0] == "M"},
                "N" :  platList.filter { $0.germanName[0] == "N"},
                "O" :  platList.filter { $0.germanName[0] == "O"},
                "P" :  platList.filter { $0.germanName[0] == "P"},
                "Q" :  platList.filter { $0.germanName[0] == "Q"},
                "R" :  platList.filter { $0.germanName[0] == "R"},
                "S" :  platList.filter { $0.germanName[0] == "S"},
                "T" :  platList.filter { $0.germanName[0] == "T"},
                "U" :  platList.filter { $0.germanName[0] == "U"},
                "V" :  platList.filter { $0.germanName[0] == "V"},
                "W" :  platList.filter { $0.germanName[0] == "W"},
                "X" :  platList.filter { $0.germanName[0] == "X"},
                "Y" :  platList.filter { $0.germanName[0] == "Y"},
                "Z" :  platList.filter { $0.germanName[0] == "Z"},
                
            ]
        
        
        lateinList  =
            [
                
                "A" :  platList.filter { $0.scientificName[0] == "A"},
                "B" :  platList.filter { $0.scientificName[0] == "B"},
                "C" :  platList.filter { $0.scientificName[0] == "C"},
                "D" :  platList.filter { $0.scientificName[0] == "D"},
                "E" :  platList.filter { $0.scientificName[0] == "E"},
                "F" :  platList.filter { $0.scientificName[0] == "F"},
                "G" :  platList.filter { $0.scientificName[0] == "G"},
                "H" :  platList.filter { $0.scientificName[0] == "H"},
                "I" :  platList.filter { $0.scientificName[0] == "I"},
                "J" :  platList.filter { $0.scientificName[0] == "J"},
                "K" :  platList.filter { $0.scientificName[0] == "K"},
                "L" :  platList.filter { $0.scientificName[0] == "L"},
                "M" :  platList.filter { $0.scientificName[0] == "M"},
                "N" :  platList.filter { $0.scientificName[0] == "N"},
                "O" :  platList.filter { $0.scientificName[0] == "O"},
                "P" :  platList.filter { $0.scientificName[0] == "P"},
                "Q" :  platList.filter { $0.scientificName[0] == "Q"},
                "R" :  platList.filter { $0.scientificName[0] == "R"},
                "S" :  platList.filter { $0.scientificName[0] == "S"},
                "T" :  platList.filter { $0.scientificName[0] == "T"},
                "U" :  platList.filter { $0.scientificName[0] == "U"},
                "V" :  platList.filter { $0.scientificName[0] == "V"},
                "W" :  platList.filter { $0.scientificName[0] == "W"},
                "X" :  platList.filter { $0.scientificName[0] == "X"},
                "Y" :  platList.filter { $0.scientificName[0] == "Y"},
                "Z" :  platList.filter { $0.scientificName[0] == "Z"},
                
            ]

       
    }
    
    
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
    
    func loadFromCSV()
    {
        let fileURL = defaults.url(forKey: "csvPath")
        let rows = NSArray(contentsOfCSVURL: fileURL, options: CHCSVParserOptions.sanitizesFields)!
        let objCArray = NSMutableArray(array: rows)
        var swiftArray: [[String]] = objCArray as! [[String]]
       
        do{
            let  regex = try Regex(".*(csv)")
            if(fileURL?.lastPathComponent.contains(regex) == false)
            {
                showAlert = true
            }
        }
        catch{
            showAlert = true
        }
        
       
        if fileURL?.absoluteString == ""
        {
            showAlert = true
            
        }


        if(swiftArray.count > 2)
        {
            swiftArray.remove(at: 0)
            swiftArray.remove(at: 1)
            print(swiftArray)
            for item in swiftArray
            {
                if(item.count != 9)
                {
                    print("No Valid Data")
                    showAlert = true
                    return
                }
                platList.append(PlantSpecies(row: item))
            }
            print(platList)
        }
        else
        {
            showAlert = true
        }

        
        
            
            
            
        
        
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
