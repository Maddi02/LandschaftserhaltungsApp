//
//  SheetSelectPlants.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 08.11.22.
//

import SwiftUI
import Foundation
struct SheetSelectPlantsShortTerm: View {
    @ObservedObject var plantSpeciesDataModel : PlantSpeciesDataModel
    var speciesCensusView : SpeciesCensusView
    var listEntry : ListEntry
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedStrength = "Deutsch"
    let strengths = ["Deutsch", "Latein"]
    @State var listDisabled = true
    @State private var selection: Set<UUID> = []
    @Environment(\.managedObjectContext) var moc
    @State private var searchText = ""
    @State  var plantSpecies : [PlantSpecies]
    @State private var showGreeting = true
    
    
    let alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    
    
    
    
    var body: some View {
        
        VStack {
            ScrollViewReader { scrollProxy in
                ZStack {
                    List {
                        
                        
                        ForEach(alphabet, id: \.self) { letter in
                            Section(header: Text(letter).multilineTextAlignment(.center).id(letter)){}
                            
                            
                            if(selectedStrength == "Latein"){
                                ForEach($plantSpecies.filter({ (plantSpecies) -> Bool in
                                    plantSpecies.scientificName.wrappedValue.prefix(1) == letter
                                })) { contact in
                                    HStack {
                                        // Image(systemName: "person.circle.fill").font(.largeTitle).padding(.trailing, 5)
                                        Text(contact.scientificName.wrappedValue)
                                        Spacer()
                                        CheckBoxView(checked: contact.isChecked)
                                    }
                                    
                                }
                            }
                            if(selectedStrength == "Deutsch"){
                                ForEach($plantSpecies.filter({ (plantSpecies) -> Bool in
                                    plantSpecies.germanName.wrappedValue.prefix(1) == letter
                                })) { contact in
                                    HStack {
                                        // Image(systemName: "person.circle.fill").font(.largeTitle).padding(.trailing, 5)
                                        Text(contact.germanName.wrappedValue)
                                        Spacer()
                                        CheckBoxView(checked: contact.isChecked)
                                    }
                                    
                                }
                                
                            }
                        }
                    }
                    .navigationTitle("Schnellaufname").font(.title3)
                    .listStyle(PlainListStyle())
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                    
                    .onChange(of: searchText) { searchText in
                        
                        if !searchText.isEmpty {
                            if(selectedStrength == "Deutsch")
                            {
                                plantSpecies = plantSpeciesDataModel.platList.filter { $0.germanName.lowercased().contains(searchText.lowercased()) }
                            }
                            if(selectedStrength == "Latein")
                            {
                                plantSpecies = plantSpeciesDataModel.platList.filter { $0.scientificName.lowercased().contains(searchText.lowercased()) }
                            }
                            
                        } else {
                            plantSpecies = plantSpeciesDataModel.platList
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack{
                                
                                Text("Sprache: ")
                                Section {
                                    Picker("", selection: $selectedStrength) {
                                        ForEach(strengths, id: \.self) {
                                            Text($0).tag($0.components(separatedBy: " ")[0])
                                        }
                                    }
                                    .pickerStyle(.menu)
                                }.frame(maxWidth: .infinity, alignment: .center)
                                
                            }
                        }
                    }
                    
                    
                    
                    
                    VStack {
                        
                        ForEach(alphabet, id: \.self) { letter in
                            HStack {
                                Spacer()
                                Button(action: {
                                    
                                    
                                    //need to figure out if there is a name in this section before I allow scrollto or it will crash
                                    if(selectedStrength == "Latein" ){
                                        if plantSpeciesDataModel.platList.first(where: { $0.scientificName.prefix(1) == letter }) != nil {
                                            withAnimation{
                                                if(checkJump(char: letter))
                                                {
                                                    scrollProxy.scrollTo(letter)
                                                }
                                            }
                                        }
                                    }
                                    if(selectedStrength == "German" ){
                                        if plantSpeciesDataModel.platList.first(where: { $0.germanName.prefix(1) == letter }) != nil {
                                            withAnimation{
                                                if(checkJump(char: letter))
                                                {
                                                    scrollProxy.scrollTo(letter)
                                                }
                                            }
                                        }
                                    }
                                }
                                       
                                       
                                       , label: {
                                    Text(letter)
                                        .font(.system(size: 12))
                                        .padding(.trailing, 7)
                                })
                                
                            }
                        }
                    }
                }
            }
            
            NavigationLink(destination: LongTimeSpeciesCensus(listEntry: listEntry, plantSpeciesDataModel: plantSpeciesDataModel, speciesCensusView: speciesCensusView).onAppear{
                speciesCensusView.saveEntrys()
                
            }){
                
                Text("Save & Go to Genaue Aufnahme")
            }.padding(.bottom, 30)
            
            TimerView(sheetSelectPlants: self).frame(maxWidth: .infinity, maxHeight: 30)
            
        }.navigationBarBackButtonHidden(true)
    }
    
    
    func checkJump(char : String) -> Bool
    {
        
        //Get index dann geh einenn davor und checke
        var counter = 0;
        for i in alphabet{
            
            if(i == char)
            {
                break
            }
            
            counter += 1
        }
        
        if(char == "A" && plantSpeciesDataModel.platList.first(where: { $0.scientificName.prefix(1) == char }) != nil)
        {
            return true
        }
        
        
        
        if(counter > 0 && counter < 27){
            if plantSpeciesDataModel.platList.first(where: { $0.scientificName.prefix(1) == alphabet[counter - 1 ] }) != nil  && plantSpeciesDataModel.platList.first(where: { $0.scientificName.prefix(1) == alphabet[counter + 1 ] }) != nil {
                return true
            }
            else{
                return false
            }
        }
        
        
        
        
        
        return false
    }
    
    
    
    
    
    func selectionActivate()
    {
        listDisabled = false
    }
    
    func selectionDeactivate()
    {
        listDisabled = true
    }
}




