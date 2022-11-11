//
//  SheetSelectPlantsLongTerm.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 09.11.22.
//

import SwiftUI

struct SheetSelectPlantsLongTerm: View {
    @StateObject var plantSpeciesDataModel = PlantSpeciesDataModel()
    var longTimeSpeciesCencus : LongTimeSpeciesCensus
    @StateObject var listEntry : ListEntry
    @Environment(\.presentationMode) var presentationMode
    @State private var selection: Set<UUID> = []
    @Environment(\.managedObjectContext) var moc
    @State  var plantSpecies : [PlantSpecies]
    @State private var searchText = ""
    let strengths = ["Deutsch", "Latein"]
    @State private var selectedStrength = "Deutsch"
    
    let alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var body: some View {
        VStack{

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
                                        
                                        if(contact.isChecked.wrappedValue)
                                        {
                                            CheckBoxView(checked: contact.isChecked).disabled(true)
                                        }
                                        else{
                                            CheckBoxView(checked: contact.isChecked)
                                        }
                                   
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
                                
                                        if(contact.isChecked.wrappedValue)
                                        {
                                            CheckBoxView(checked: contact.isChecked).disabled(true)
                                        }
                                        else{
                                            CheckBoxView(checked: contact.isChecked)
                                        }
                                     
                          
                                        
                                        
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
                                                if(checkJump1(char: letter))
                                                {
                                                    scrollProxy.scrollTo(letter)
                                                }
                                            }
                                        }
                                    }
                                    if(selectedStrength == "German" ){
                                        if plantSpeciesDataModel.platList.first(where: { $0.germanName.prefix(1) == letter }) != nil {
                                            withAnimation{
                                                if(checkJump1(char: letter))
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
            NavigationLink(destination:  getDestination().onAppear{
                longTimeSpeciesCencus.saveEntrysLongTerm()
            })
            {
                Text("Save & geh zur nächsten Seite")
            }
            
          //  TimerView(sheetSelectPlants: self)
            
        }.navigationBarBackButtonHidden(true)
    }
    private func getDestination() -> AnyView
    {
        
        if(listEntry.descriptionField == "FFH Mähwiese")
        {
            return AnyView(InformationFFHWiese())
        }
        else {
            return AnyView(InformationAnderesBiotop())
        }
        
    }
    
    private func checkJump1(char : String) -> Bool
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

        
        
        
        
        
        
        
    
}


