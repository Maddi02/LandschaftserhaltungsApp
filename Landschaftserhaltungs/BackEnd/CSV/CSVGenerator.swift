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
        csvWriter?.writeField("Rote Liste")
        csvWriter?.writeField("6510 Kennarten")
        csvWriter?.writeField("6510 Zählarten")
        csvWriter?.writeField("N - Zahl")
        csvWriter?.writeField("F - Zahl")
        csvWriter?.writeField("Bewertung für Mahwiesen - LRT")

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
            csvWriter?.writeField(i.element.getRedList())
            csvWriter?.writeField(i.element.getReating1a())
            csvWriter?.writeField(i.element.getReating1b())
            csvWriter?.writeField(i.element.getReating1c())
            csvWriter?.writeField(i.element.getReating1d())
            csvWriter?.writeField(i.element.getReating2())
         
            
            csvWriter?.finishLine()
        }
        csvWriter?.finishLine()
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("Anzahl Arten insgesamt")
        csvWriter?.writeField("38")
        csvWriter?.writeField("28")
        csvWriter?.finishLine()
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("Anzahl Arten Schnellaufnahme")
        csvWriter?.writeField("8")
        csvWriter?.writeField("18")

        csvWriter?.finishLine()
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("Anzahl Kennarten 6510")
        csvWriter?.writeField("8")
        csvWriter?.writeField("18")
        
        
        csvWriter?.finishLine()
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("Anzahl Zählarten 6510")
        csvWriter?.writeField("8")
        csvWriter?.writeField("18")
        
        csvWriter?.finishLine()
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("Mittlere N - Zahl")
        csvWriter?.writeField("8")
        csvWriter?.writeField("18")
        
        csvWriter?.finishLine()
        
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("Mittlere F - Zahl")
        csvWriter?.writeField("8")
        csvWriter?.writeField("18")
        
        csvWriter?.finishLine()
        
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("Anzahl Magerkeitszeiger")
        csvWriter?.writeField("8")
        csvWriter?.writeField("18")
        
        csvWriter?.finishLine()
        
        
        
        
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
