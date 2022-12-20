//
//  SpeciesCensusView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI
import CoreData

struct alertView : View
{
    @Environment(\.dismiss) var dismiss
    @State var showAlert : Bool
    var body: some View{
        Text("Sie können keine neue Aufnahme starten. --> Daten schon vorhandne")
            Button("Zurück", role: .cancel) {
              dismiss()
            }
    }
}
struct alertViewWrongData : View
{
    @Environment(\.dismiss) var dismiss
    @State var showAlert : Bool
    var body: some View{
        Text("Upps.. es sieht so aus, als ob Sie eine invalide Datei geladen hätten. Dies kann folgenden Gründe haben \n1.\nAchten Sie darauf, dass Ihre Datei 9 Reihen enthält. \n2.\nAchten Sie darauf, dass Ihre Datei in dem Landschaftserhaltungsordner liegt.\n3.\nÜberprüfen Sie, ob Ihre Datei auf .csv endet.\n4.\nHaben Sie ein Datei ausgewählt\n\nÜberprüfen Sie ihr Import wiefolgt: Home Screen -> Profil")
            Button("Zurück", role: .cancel) {
              dismiss()
            }
    }
}

struct SpeciesCensusView: View {
    
    @Environment(\.managedObjectContext) var moc
    @StateObject var plantSpeciesDataModel = PlantSpeciesDataModel()
    @StateObject var listEntry : ListEntry
    @State private var showSelectionView = false
    @State private var showingAlert = false
    @State var fieldDescription : String = ""
    @State var typeOfField : String
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let  width : Double = 250
    public var description : String
    
    var body: some View {
        
        VStack{
            
            if(plantSpeciesDataModel.showAlert)
            {
                alertViewWrongData(showAlert: true)
               // Text("HHHh")
            }
            
            if(!plantSpeciesDataModel.showAlert){
                if(listEntry.PlantArray.count > 0  || listEntry.PlantArrayLongTerm.count > 0 || ((listEntry.infos?.dataOfTaking) != nil))
                {
                    alertView(showAlert: true)
                    
                }
                
                
                else
                {
                    if(typeOfField == "FFH Mähwiese"){
                        
                        Text("INFO").frame(maxWidth: .infinity, alignment: .top).font(.title2).padding()
                        
                        Text("Feldtypauswahl: \(typeOfField) - Artenzählung Info \n\n 1. Schnellaufnahme \n Hier können Sie unten einen Timer starten und die gefundenen Pflanzen aus der Artenliste auswählen. Wenn die Schnellaufnahme beendet werden soll, drücken Sie auf „Weiter“. \n\n 2. Weitere Arten \n An dieser Stelle gibt es keinen Timer mehr und Sie können weitere Pflanzen, die im ersten Durchlauf nicht erfasst wurden, hinzufügen. \n 1 und 2 können nicht wiederholt werden. \n\n 3. Informationen \n Als letztes können Sie übrige Informationen für den Bericht hinzufügen. Die Eingaben können nachträglich verändert oder ergänzt werden. ").padding(.top).padding(.leading)
                    }
                    
                    else {
                        Text("INFO").frame(maxWidth: .infinity, alignment: .top).font(.title2).padding()
                        Text("Feldtypauswahl: \(typeOfField) - Artenzählung Info \n\n Hier müssen Sie im folgenden eine genaue Aufnahme der Pflanzen durchführen. Anschließend können Sie übrige Informationen für den Bericht hinzufügen. Die Eingaben können nachträglich verändert oder ergänzt werden.").padding(.top).padding(.leading)
                        
                        
                    }
                    Form{
                        
                        
                        
                        
                        if(typeOfField == "FFH Mähwiese"){
                            NavigationLink(destination: SheetSelectPlantsShortTerm(plantSpeciesDataModel: plantSpeciesDataModel, plantSpecies: plantSpeciesDataModel.platList, speciesCensusView: self, listEntry: listEntry)){
                                
                                Text("Start")
                            }
                        }
                        else{
                            
                            NavigationLink(destination: SheetSelectPlantsLongTerm(plantSpeciesDataModel: plantSpeciesDataModel , listEntry: listEntry)){
                                
                                Text("Start")
                            }
                            
                        }
                        
                        
                        
                    }
                }
            }
        }
        
    }
    
    
    private func contains(str: String) -> Bool
    {
        for i in listEntry.PlantArray
        {
            if(i.germanName == str)
            {
                return true
            }
        }
        return false
    }
    
    
    public func saveEntrys()
    {
        
        
        
        print("Size \(listEntry.PlantArray.count)")
        print("Size \(listEntry.PlantArray.count)")
        let plant = PlantSpeciesItem(context: moc)
        plant.descriptionField = description
        
        
        for (_ ,list1) in plantSpeciesDataModel.germanList
        {
            
            for list in list1{
                print("ergeger \(list.germanName) \(list.isChecked)")
                
                if(list.isChecked){
                    print(list.germanName)
                    if(contains(str: list.germanName))
                    {
                        print("Found")
                    }
                    else{
                        print("try to insert ")
                        let plant = PlantSpeciesItem(context: moc)
                        plant.species = listEntry
                        plant.scientificName = list.scientificName
                    
                        plant.redListBw = list.redListBw
                        plant.germanName = list.germanName
                        plant.checked = list.isChecked
                        plant.evaluation1a = list.evaluation1a
                        plant.evaluation1b = list.evaluation1b
                        plant.evaluation1c = list.evaluation1c
                        plant.evaluation1d = list.evaluation1d
                        plant.evaluation2 = list.evaluation2
                        plant.evaluation3 = list.evaluation3
                        plant.noun = list.noun
                        print(list.scientificName)
                        
                        do {
                            try moc.save()
                            print("Success")
                        } catch {
                            print("Error saving: \(error)")
                        }
                    }
                }
                
                /*
                if (listEntry.PlantArray.count == 0)
                {
                    let plant = PlantSpeciesItem(context: moc)
                    plant.species = listEntry
                    plant.scientificName = list.scientificName
                    print(list.scientificName)
                    
                    do {
                        try moc.save()
                        print("Success")
                    } catch {
                        print("Error saving: \(error)")
                    }
                }
                 */
            }
            
            
        }
        
    }
    
}

