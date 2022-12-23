//
//  PDFWEB.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 26.11.22.
//

import Foundation
import PDFKit
import TPPDF
class PDFCreatorDiffrentBiotop
{

    
    var  url = URL(string: "")
   
    var userSettings = UserSettings()
    
    let defaults = UserDefaults.standard
    
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }

    func generatePdf(listEntry : ListEntry)
    {
        url =  getDocumentsDirectory().appendingPathComponent("awesome.pdf")
        let document = PDFDocument(format: .a4)
        let generator = PDFGenerator(document: document)
        generator.debug = true
        url =  try! generator.generateURL(filename: "Example.pdf")

    }
    
    
    func generatePdfAndGetURL(listEntry : ListEntry) -> URL {
    

        url =  getDocumentsDirectory().appendingPathComponent("awesome.pdf")
        let document = PDFDocument(format: .a4)
        let imageElementHeader = PDFImage(image: listEntry.contract?.picture ?? UIImage(), size: CGSize(width: 150, height: 80))
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
     
        var allPlants : [PlantMatcher] = []
        //Header
        
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
        
        
        
        for i in listEntry.PlantArray
        {
            allPlants.append(PlantMatcher(scientificName: i.scientificName ?? " ", germanName: i.germanName ?? " ", redList: i.redListBw ?? " ", reating1a: i.evaluation1a ?? " " , reating1b: i.evaluation1b ?? " ", reating1c: i.evaluation1c ?? " " , reating1d: i.evaluation1d ?? " " , reating2: i.evaluation2 ?? " " , reating3: i.evaluation3 ?? " ",frequency: i.frequency ?? " ", noun: i.noun ?? " " ))
        }
        
        for i in listEntry.PlantArrayLongTerm
        {
            allPlants.append(PlantMatcher(scientificName: i.scientificName ?? " ", germanName: i.germanName ?? " ", redList: i.redListBw ?? " ", reating1a: i.evaluation1a ?? " " , reating1b: i.evaluation1b ?? " ", reating1c: i.evaluation1c ?? " " , reating1d: i.evaluation1d ?? " " , reating2: i.evaluation2 ?? " " , reating3: i.evaluation3 ?? " ",frequency: i.frequency ?? " " , noun : i.noun ?? " "))
        }
        
        
        
        
        var extinctOrLost : String = "ausgestorben oder verschollen: "
        var endangeredByExtinction : String = "vom Aussterben bedroht: "
        var stronglyEndangered : String = "stark gefährdet: "
        var endangered : String = "gefährdet: "
        var preWarningList : String = "Vorwarnliste: "
        var textRedListForPDF : String = ""
        var counterRedList : Int = 0
    
    
        
        
        for i in allPlants
        {
            if(i.getRedList() == "0")
            {
                extinctOrLost += "\(i.getGermanName()) (\(i.getScientificName())) \n"
                counterRedList+=1
            }
            
            if(i.getRedList() == "1")
            {
                endangeredByExtinction += "\(i.getGermanName()) (\(i.getScientificName())) \n"
                counterRedList+=1
            }
            
            if(i.getRedList() == "2")
            {
                stronglyEndangered += "\(i.getGermanName()) (\(i.getScientificName())) \n"
                counterRedList+=1
            }
            
            if(i.getRedList() == "3")
            {
                endangered += "\(i.getGermanName()) (\(i.getScientificName())) \n"
                counterRedList+=1
            }
            
            if(i.getRedList() == "V")
            {
                preWarningList += "\(i.getGermanName()) (\(i.getScientificName())) \n"
                counterRedList+=1
            }
  
        }
        
        if(extinctOrLost != "ausgestorben oder verschollen: ")
        {
            textRedListForPDF += extinctOrLost
        }
        
        if(endangeredByExtinction != "vom Aussterben bedroht: ")
        {
            textRedListForPDF += endangeredByExtinction
        }
        
        if(stronglyEndangered != "stark gefährdet: ")
        {
            textRedListForPDF += stronglyEndangered
        }
        
        if(endangered != "gefährdet: ")
        {
            textRedListForPDF += endangered
        }
        
        if(preWarningList != "Vorwarnliste: ")
        {
            textRedListForPDF += preWarningList
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        allPlants = allPlants.sorted{$0.getScientificName() < $1.getScientificName()}
        
        
        
        
        
        
        
        let table = PDFTable(rows: 13, columns: 2)
 
        // Tables can contain Strings, Numbers, Images or nil, in case you need an empty cell.
        // If you add a unknown content type, an assertion will be thrown and the rendering will stop.
        table.content = [
            [nil,       "Information"],
            ["Datum",  "\(listEntry.infos?.dataOfTaking ?? Date())"],
            ["Bewirt\nschaftung",    "\(listEntry.infos?.farming ?? "No Value")"],
            ["Lage",    "\(listEntry.infos?.position ?? "No Value")"],
            ["Vegetations\nbeschreibung",  "\(listEntry.infos?.vegetationDescription ?? "No Value")"],
            ["Blühaspekt",     "\(listEntry.infos?.bloomAspect ?? "No Value")"],
            ["Artenzahl\ngesamt",  "\(listEntry.PlantArrayLongTerm.count + listEntry.PlantArray.count)"],
            ["Anzahl Rote\nListe BW",    "Anzahl: \(counterRedList)\n\(textRedListForPDF)"],
            ["Schutzstatus",   "\(listEntry.infos?.protectionStatus ?? "No Value")"],
            ["Faunistische\nBeobachtung",    "\(listEntry.infos?.faunisticObservation ?? "No Value")"],
            ["Vertragsziel\nerfüllt",     "\(listEntry.infos?.contractTarget ?? "No Value")"],
            ["Anpassung\nAuflagen",     "\(listEntry.infos?.adaptationEditions ?? "No Value")"],
            ["Weitere\nPflegeaufnahmen",     "\(listEntry.infos?.furtherMaintenanceMeasures ?? "No Value")"]
        ]
        
        
        
        
        
        table.widths = [0.3, 0.7]
        table.rows.allRowsAlignment = [.left, .left]
        document.add(table: table)
    

        //Body Third Page


        for i in listEntry.infos?.pictureArray ?? []
        {
            document.createNewPage()
            document.add(.contentCenter, image: PDFImage(image: i.picutre ?? UIImage()))
         
        }
        
        
        
        //Body XXX Page
        
        document.createNewPage()
        
        
        document.add(.contentLeft, text: "Legende")
        document.add(.contentLeft, text: " ")
        document.add(.contentLeft, text: "WN\t= Wissenschaftlicher Name")
        document.add(.contentLeft, text: "DN\t\t= Deutscher Name")
        document.add(.contentLeft, text: "1*\t\t= Beeinflusste Arten")
        document.add(.contentLeft, text: "2\t\t= Bewertungsneutrale Arten")
        document.add(.contentLeft, text: "3\t\t= Magerkeitszeiger")
        document.add(.contentLeft, text: "RT\t\t= Rote Liste")
        document.add(.contentLeft, text: "FR\t\t= Häufigkeit")
        document.add(.contentLeft, text: "KN\t\t= Kennart")
        

  

        document.createNewPage()
        let tablePlant = PDFTable(rows: allPlants.count + 1, columns: 11)
        tablePlant.widths = [0.225, 0.225, 0.05, 0.05,0.05,0.05,0.05,0.05,0.05,0.05, 0.15]
        tablePlant.showHeadersOnEveryPage = false
        tablePlant.rows.allRowsAlignment = [.left, .left, .center, .center, .center, .center, .center,.center, .center, .center]
        
        tablePlant[0, 0].content = "WN".asTableContent
        tablePlant[0, 1].content = "DN".asTableContent
        tablePlant[0, 2].content = "1a".asTableContent
        tablePlant[0, 3].content = "1b".asTableContent
        tablePlant[0, 4].content = "1c".asTableContent
        tablePlant[0, 5].content = "1d".asTableContent
        tablePlant[0, 6].content = "2".asTableContent
        tablePlant[0, 7].content = "3".asTableContent
        tablePlant[0, 8].content = "RT".asTableContent
        tablePlant[0, 9].content = "FR".asTableContent
        tablePlant[0, 10].content = "KN".asTableContent
        
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
               
                        tablePlant[row, column].content = "\(allPlants[row-1].getRedList())".asTableContent
                    
                }
                if(column == 9){
               
                        tablePlant[row, column].content = "\(allPlants[row-1].getFrequency())".asTableContent
                    
                }
                
                if(column == 10){
                    tablePlant[row,column].content = "\(allPlants[row-1].getNoun())".asTableContent
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
