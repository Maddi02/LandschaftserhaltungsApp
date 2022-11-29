//
//  CSVGenerator.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 29.11.22.
//

import Foundation

class CSVGenerator
{
    
    
    func generate(listEntry : ListEntry)
    {
        let sFileName = "test.csv"
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        
        
        let documentURL = URL(fileURLWithPath: documentDirectoryPath).appendingPathComponent(sFileName)
        let output = OutputStream.toMemory()
        
        let csvWriter = CHCSVWriter(outputStream: output, encoding: String.Encoding.utf8.rawValue, delimiter: ",".utf16.first!)
        
        
        //HEADER FOR CSV File
        csvWriter?.writeField("Wissenschaftlicher Name")
        csvWriter?.writeField("Deutscher Name")
        csvWriter?.writeField("1a")
        csvWriter?.writeField("1b")
        csvWriter?.writeField("1c")
        csvWriter?.writeField("1d")
        csvWriter?.writeField("2")
        csvWriter?.writeField("3")
        csvWriter?.writeField("Kennart")
        csvWriter?.writeField("Zählart")
        csvWriter?.writeField("Rote Liste")
        csvWriter?.finishLine()
        
        //ARRAY TO ADD DATA TO CSV
        var  allPlants : [PlantMatcher] = []
        for i in listEntry.PlantArray
        {
            allPlants.append(PlantMatcher(scientificName: i.scientificName ?? " ", germanName: i.germanName ?? " ", redList: i.redListBw ?? " ", reating1a: i.nitrogenIndicator , reating1b: i.brachePointer , reating1c: i.disturbanceIndicator , reating1d: i.seedSpecies , reating2: i.valuationNeutralType , reating3: i.mergerityPointer ))
        }
        
        for i in listEntry.PlantArrayLongTerm
        {
            allPlants.append(PlantMatcher(scientificName: i.scientificName ?? " ", germanName: i.germanName ?? " ", redList: i.redListBw ?? " ", reating1a: i.nitrogenIndicator , reating1b: i.brachePointer , reating1c: i.disturbanceIndicator , reating1d: i.seedSpecies , reating2: i.valuationNeutralType , reating3: i.mergerityPointer ))
        }
        
        allPlants = allPlants.sorted{$0.getScientificName() < $1.getScientificName()}
        
        
        
        for(i) in allPlants.enumerated()
        {
            csvWriter?.writeField(i.element.getScientificName())
            csvWriter?.writeField(i.element.getGermanName())
            csvWriter?.writeField(i.element.getReating1a())
            csvWriter?.writeField(i.element.getReating1b())
            csvWriter?.writeField(i.element.getReating1c())
            csvWriter?.writeField(i.element.getReating1d())
            csvWriter?.writeField(i.element.getReating2())
            csvWriter?.writeField(i.element.getReating3())
            csvWriter?.writeField(i.element.getReating3())
            csvWriter?.writeField(i.element.getReating3())
            csvWriter?.writeField(i.element.getRedList())
            
            csvWriter?.finishLine()
        }
        
        csvWriter?.closeStream()
        
        let buffer = (output.property(forKey: .dataWrittenToMemoryStreamKey) as? Data)!
        do{
            try buffer.write(to: documentURL)
        }
        catch
        {
            
        }
        
    }
    
}
