//
//  SpeciesCensusView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI
import CoreData
struct SpeciesCensusView: View {
    
    @Environment(\.managedObjectContext) var moc
    @StateObject var plantSpeciesDataModel = PlantSpeciesDataModel()
    @StateObject var listEntry : ListEntry
    @State private var showSelectionView = false
    @State var fieldDescription : String = ""
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let  width : Double = 250
    public var description : String
    
    var body: some View {
        
        VStack{
            Text("Schnellaufnahme").font(Font.title).frame(maxWidth: .infinity , alignment: .topLeading)
            Text("\(description) ").font(Font.title3).frame(maxWidth: .infinity , alignment: .topLeading)
        }
        
        Form{
            
            Section(header: Text("Description"))
            {
                TextField("Fügen Sie ein Beschreibung hinzu", text: $fieldDescription)
            }
            
            NavigationLink(destination: SheetSelectPlantsShortTerm(plantSpeciesDataModel: plantSpeciesDataModel, plantSpecies: plantSpeciesDataModel.platList, speciesCensusView: self, listEntry: listEntry)){
                
                Text("Wähle Pflanze aus")
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
                        plant.southernGaelandschaften = list.southernGaelandschaften
                        plant.schaebischeAlb = list.schaebischeAlb
                        plant.responsibility = list.responsibility
                        plant.redListBw = list.redListBw
                        plant.odenWald = list.odenWald
                        plant.oberReihnArea = list.oberReihnArea
                        plant.nothernGaelandschaften = list.nothernGaelandschaften
                        plant.germanName = list.germanName
                        plant.checked = list.isChecked
                        plant.blackForest = list.blackForest
                        plant.alpenvorland = list.alpenvorland
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

