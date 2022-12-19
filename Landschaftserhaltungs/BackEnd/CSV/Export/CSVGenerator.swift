//
//  CSVGenerator.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 29.11.22.
//

import Foundation

class CSVGenerator
{
    
    
    func generateInitFolder()  -> URL// CALL This in onboarding to create app folder
    {
        
            let sFileName = "example.csv"
            let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
            
            
            let documentURL = URL(fileURLWithPath: documentDirectoryPath).appendingPathComponent(sFileName)
            let output = OutputStream.toMemory()
            
            let csvWriter = CHCSVWriter(outputStream: output, encoding: String.Encoding.utf8.rawValue, delimiter: ",".utf16.first!)
            
            
            //HEADER FOR CSV File
            csvWriter?.writeField("Wissenschaftlicher Name")
            csvWriter?.writeField("Deutscher Name")
            csvWriter?.writeField("Rote Liste")
            csvWriter?.writeField("1a")
            csvWriter?.writeField("1b")
            csvWriter?.writeField("1c")
            csvWriter?.writeField("1d")
            csvWriter?.writeField("2")
            csvWriter?.writeField("3")
            csvWriter?.writeField("6510 Kennarten")
            csvWriter?.writeField("6510 Zählarten")
            csvWriter?.writeField("N - Zahl")
            csvWriter?.writeField("F - Zahl")
            csvWriter?.writeField("Häufigkeit")
            csvWriter?.writeField("")
            csvWriter?.writeField("")
            csvWriter?.writeField("")
            csvWriter?.writeField("")
        
        csvWriter?.finishLine()
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("Beispiel CSV")
        
        
        csvWriter?.closeStream()
        
        let buffer = (output.property(forKey: .dataWrittenToMemoryStreamKey) as? Data)!
        do{
            try buffer.write(to: documentURL)
            print(documentURL)
        }
        catch
        {
            
        }
        
        return documentURL
        
    }
    
    
    
    
    
    func generateAndGetUrl(listEntry : ListEntry) -> URL
    {
        let sFileName = "\(Int.random(in: 1...100000)).csv"
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        
        
        let documentURL = URL(fileURLWithPath: documentDirectoryPath).appendingPathComponent(sFileName)
        let output = OutputStream.toMemory()
        
        let csvWriter = CHCSVWriter(outputStream: output, encoding: String.Encoding.utf8.rawValue, delimiter: ",".utf16.first!)
        
        
        //HEADER FOR CSV File
        csvWriter?.writeField("Wissenschaftlicher Name")
        csvWriter?.writeField("Deutscher Name")
        csvWriter?.writeField("Rote Liste")
        csvWriter?.writeField("1a")
        csvWriter?.writeField("1b")
        csvWriter?.writeField("1c")
        csvWriter?.writeField("1d")
        csvWriter?.writeField("2")
        csvWriter?.writeField("3")
        csvWriter?.writeField("6510 Kennarten")
        csvWriter?.writeField("6510 Zählarten")
        csvWriter?.writeField("N - Zahl")
        csvWriter?.writeField("F - Zahl")
        csvWriter?.writeField("Häufigkeit")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")
        csvWriter?.writeField("")


        csvWriter?.finishLine()
        
        //ARRAY TO ADD DATA TO CSV
        var  allPlants : [PlantMatcher] = []
        for i in listEntry.PlantArray
        {
            allPlants.append(PlantMatcher(scientificName: i.scientificName ?? " ", germanName: i.germanName ?? " ", redList: i.redListBw ?? " ", reating1a: i.evaluation1a ?? " " , reating1b: i.evaluation1b ?? " ", reating1c: i.evaluation1c ?? " " , reating1d: i.evaluation1d ?? " " , reating2: i.evaluation2 ?? " " , reating3: i.evaluation3 ?? " ",frequency: i.frequency ?? " ",  noun: i.noun ?? " "))
        }
        
        for i in listEntry.PlantArrayLongTerm
        {
            allPlants.append(PlantMatcher(scientificName: i.scientificName ?? " ", germanName: i.germanName ?? " ", redList: i.redListBw ?? " ", reating1a: i.evaluation1a ?? " " , reating1b: i.evaluation1b ?? " ", reating1c: i.evaluation1c ?? " " , reating1d: i.evaluation1d ?? " " , reating2: i.evaluation2 ?? " " , reating3: i.evaluation3 ?? " ",frequency: i.frequency ?? " " , noun : i.noun ?? " "))
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
            csvWriter?.writeField(i.element.getReating3())
            csvWriter?.writeField(i.element.getFrequency())
         
            
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
            print(documentURL)
        }
        catch
        {
            
        }
        
        print(documentURL)
        
        return documentURL
        
    }
    
}
