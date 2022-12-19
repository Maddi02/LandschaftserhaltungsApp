//
//  PDFCreatorFFH.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 28.11.22.
//

import Foundation
import TPPDF
import PDFKit

class PDFCreatorFFH
{
    var userSettings = UserSettings()
    
    let defaults = UserDefaults.standard

    var  url = URL(string: "")
    
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
    func generatePdf(listEntry : ListEntry)
    {
        url =  getDocumentsDirectory().appendingPathComponent("awesome.pdf")
        // var url = URL(string: "file://~/Desktop/awesome.pdf")!
        let document = PDFDocument(format: .a4)
        document.add(.contentCenter, text: "Create PDF documents easily.")
        let generator = PDFGenerator(document: document)
        generator.debug = true
        url =  try! generator.generateURL(filename: "Example.pdf")
        // print("Output URL:", url)
        
    }
    
    
    func generatePdfAndGetURL(listEntry : ListEntry) -> URL {
        url =  getDocumentsDirectory().appendingPathComponent("awesome.pdf")
        let document = PDFDocument(format: .a4)
        let imageElementHeader = PDFImage(image: userSettings.getImage() , size: CGSize(width: 150, height: 80))
        var photoQuality = defaults.double(forKey: "photoQuality")
        
        if photoQuality == 0
        {
            photoQuality = 1.0
        }
        
        let imageOverViewPic = PDFImage(image: listEntry.contract?.picture?.resizeImage(targetRatio: photoQuality) ?? UIImage())
        
        let headingStyle1 = document.add(style: PDFTextStyle(name: "Heading 1",
                                                             font: Font.boldSystemFont(ofSize: 20.0),
                                                             color: Color.black))
        let style = PDFLineStyle(type: .full, color: .darkGray, width: 0.5)
    
        
        //Header
        document.add(.contentCenter, text: "Create PDF documents easily.")
        document.add(.headerRight, image: imageElementHeader)
        document.add(.headerLeft, text: "Bearbeiter")
        document.add(.headerLeft, text: "\(userSettings.getLastName()) \(userSettings.getFirstName())")
        
        //Body First Page
        document.add(textObject: PDFSimpleText(text: "Flächenbeurteilung der Vertragsflächen", style: headingStyle1))
        document.add(.contentLeft, text: " ")
        document.add(.contentLeft, text: "Zu: ")
        document.add(.contentLeft, text: "\(listEntry.contract?.lastName ?? ""),  \(listEntry.contract?.firstName ?? " ")")
        document.add(.contentLeft, text: "Neuvertrag")
        document.add(.contentLeft, text: "\(listEntry.contract?.particularities ?? " ")")
        document.addLineSeparator(PDFContainer.contentLeft, style: style)
        document.add(space: 15.0)
        document.add(.contentCenter, image: imageOverViewPic)
        
        
        //Body Second Page
        document.createNewPage()
        document.add(.contentLeft, text: " ")
        
        let table = PDFTable(rows: 20, columns: 2)
        
        // Tables can contain Strings, Numbers, Images or nil, in case you need an empty cell.
        // If you add a unknown content type, an assertion will be thrown and the rendering will stop.
        table.content = [
            [nil,       "Information"],
            ["Datum",  "\(listEntry.infos?.dataOfTaking ?? Date())"],
            ["Bewirt-\n schaftung",    "\(listEntry.infos?.farming ?? "No Value")"],
            ["Lage",    "\(listEntry.infos?.position ?? "No Value")"],
            ["Vegetations-\n beschreibung ",  "\(listEntry.infos?.vegetationDescription ?? "No Value")"],
            ["Blühaspekt",     "\(listEntry.infos?.bloomAspect ?? "No Value")"],
            ["Artenzahl\n gesamt",  "\(listEntry.PlantArrayLongTerm.count + listEntry.PlantArray.count)"],
            ["Artenzahl Schnellaufnahme",  "\(listEntry.PlantArray.count)"],
            ["Anzahl Rote\n Liste BW",    "Sunlight shining through the leafs."],
            ["Bewertung Arteninventar",    "\(listEntry.infos?.evaluationSpeciesInventory ?? "No Value")"],
            ["Bewertung Habitatsstruktur",    "\(listEntry.infos?.assessmentHabitatStructure ?? "No Value")"],
            ["Bewertung Beeinträchtigung",    "\(listEntry.infos?.ratingImpairment ?? "No Value")"],
            ["Gesamtbewertung Erhaltungszustand",    "\(listEntry.infos?.overallAssessmentOfTheStateOfPreservation ?? "No Value")"],
            ["Magerkeitszeiger",    "No Value"],
            ["Beeinträchtigende Arten",    "No Value"],
            ["Schutzstatus",  "\(listEntry.infos?.protectionStatus ?? "No Value")"],
            ["Faunistische\n Beobachtung",     "\(listEntry.infos?.faunisticObservation ?? "No Value")"],
            ["Vertragsziel\n erfüllt",     "\(listEntry.infos?.contractTarget ?? "No Value")"],
            ["Anpassung\n Auflagen",     "\(listEntry.infos?.adaptationEditions ?? "No Value")"],
            ["Weitere\n Pflegeaufnah-\n men",     "\(listEntry.infos?.furtherMaintenanceMeasures ?? "No Value")"]
        ]
        
        
        
        
        
        table.widths = [0.2, 0.8]
        table.rows.allRowsAlignment = [.left, .left]
        document.add(table: table)
        
        
        //Body Third Page
        var allPlants : [PlantMatcher] = []
        
        for i in listEntry.infos?.pictureArray ?? []
        {
            document.createNewPage()
            document.add(.contentCenter, image: PDFImage(image: i.picutre ?? UIImage()))
            
        }
        
        
        
        //Body XXX Page
        
        for i in listEntry.PlantArray
        {
            allPlants.append(PlantMatcher(scientificName: i.scientificName ?? " ", germanName: i.germanName ?? " ", redList: i.redListBw ?? " ", reating1a: i.evaluation1a ?? " " , reating1b: i.evaluation1b ?? " ", reating1c: i.evaluation1c ?? " " , reating1d: i.evaluation1d ?? " " , reating2: i.evaluation2 ?? " " , reating3: i.evaluation3 ?? " ",frequency: i.frequency ?? " " ))
        }
        
        for i in listEntry.PlantArrayLongTerm
        {
            allPlants.append(PlantMatcher(scientificName: i.scientificName ?? " ", germanName: i.germanName ?? " ", redList: i.redListBw ?? " ", reating1a: i.evaluation1a ?? " " , reating1b: i.evaluation1b ?? " ", reating1c: i.evaluation1c ?? " " , reating1d: i.evaluation1d ?? " " , reating2: i.evaluation2 ?? " " , reating3: i.evaluation3 ?? " ",frequency: i.frequency ?? " " ))
        }
        
        allPlants = allPlants.sorted{$0.getScientificName() < $1.getScientificName()}
        
        
        
        
        // let tablePlant = PDFTable(rows: 50 , columns: 3)
        
        // tablePlant.content = [ ["WN" , "DN" , "1a","1b","1c","1d","2","3","RD"]]
        
        /*
         for i in allPlants
         {
         tablePlant[colum : 0][0].content =  "\(i.getScientificName()) , \(i.getGermanName()) , \(setCross(checked: i.getReating1a())),\(setCross(checked: i.getReating1b())), \(setCross(checked: i.getReating1c())), \(setCross(checked: i.getReating1d())), \(setCross(checked: i.getReating2())),  \(setCross(checked: i.getReating3())), \(i.getRedList())".asTableContent
         }
         */
        document.createNewPage()
        let tablePlant = PDFTable(rows: allPlants.count + 1, columns: 12)
        tablePlant.widths = [0.25, 0.25, 0.05, 0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05]
        tablePlant.showHeadersOnEveryPage = false
        tablePlant.rows.allRowsAlignment = [.left, .left, .center, .center, .center, .center, .center,.center, .center]
        
        tablePlant[0, 0].content = "WN".asTableContent
        tablePlant[0, 1].content = "DN".asTableContent
        tablePlant[0, 2].content = "1a".asTableContent
        tablePlant[0, 3].content = "1b".asTableContent
        tablePlant[0, 4].content = "1c".asTableContent
        tablePlant[0, 5].content = "1d".asTableContent
        tablePlant[0, 6].content = "2".asTableContent
        tablePlant[0, 7].content = "3".asTableContent
        tablePlant[0, 8].content = "KA".asTableContent
        tablePlant[0, 9].content = "ZA".asTableContent
        tablePlant[0, 10].content = "RT".asTableContent
        tablePlant[0, 11].content = "FR".asTableContent
        
        for row in 1..<tablePlant.size.rows {
            tablePlant[row, 0].content = "\(allPlants[row-1].getScientificName())".asTableContent
            for column in 1..<tablePlant.size.columns {
                
                if(column == 1){
                    tablePlant[row, column].content = "\(allPlants[row-1].getGermanName())".asTableContent
                }
                if(column == 2){
                    tablePlant[row, column].content = "\(allPlants[row-1].getReating1a())".asTableContent
                }
                
                if(column == 3){
                    tablePlant[row, column].content = "\(allPlants[row-1].getReating1b())".asTableContent
                }
                
                
                if(column == 4){
                    tablePlant[row, column].content = "\(allPlants[row-1].getReating1c())".asTableContent
                }
                
                if(column == 5){
                    tablePlant[row, column].content = "\(allPlants[row-1].getReating1d())".asTableContent
                }
                
                
                if(column == 6){
                    tablePlant[row, column].content = "\(allPlants[row-1].getReating2())".asTableContent
                }
                
                
                if(column == 7){
                    tablePlant[row, column].content = "\(allPlants[row-1].getReating3())".asTableContent
                }
                
                
                if(column == 8){
                    
                    tablePlant[row, column].content = "\(allPlants[row-1].getReating3())".asTableContent
                    
                }
                
                
                if(column == 9){
                    
                    tablePlant[row, column].content = "\(allPlants[row-1].getReating3())".asTableContent
                    
                }
                
                
                if(column == 10){
                    
                    tablePlant[row, column].content = "\(allPlants[row-1].getRedList())".asTableContent
                    
                }
                
                if(column == 11){
                    
                    tablePlant[row, column].content = "\(allPlants[row-1].getFrequency())".asTableContent
                    
                }
                
                
            }
        }
        
        //  table.widths = [0.1, 0.1, 0.1, 0.1,0.1,0.1,0.1,0.1,0.2]
        //  table.rows.allRowsAlignment = [.center, .center,.center, .center,.center, .center,.center, .center,.center]
        document.add(table : tablePlant)
        
        
        
        let generator = PDFGenerator(document: document)
        url =  try! generator.generateURL(filename: "\(Int.random(in: 0..<10000)).pdf")
        return url!
    }
    
    func getUrl() -> URL
    {
        return url!
    }
    
    private func setCross(checked : Bool) -> String
    {
        if(checked)
        {
            return "X"
        }
        else
        {
            return " "
        }
    }
}
