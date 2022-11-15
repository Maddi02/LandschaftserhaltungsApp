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
    @State private var isItemCheck : Bool = false
    let strengths = ["Deutsch", "Latein"]
    @State private var selectedStrength = "Deutsch"
    @State private var show = true
    @Environment(\.isSearching) private var isSearching: Bool
    @Environment(\.dismissSearch) private var dismissSearch
    
    @State private var selection1: String?
    
    let names = [
        "Cyril",
        "Lana",
        "Mallory",
        "Sterling"
    ]
    
    
    
    let alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var body: some View {
        VStack{
            
            ScrollViewReader { scrollProxy in
                ZStack {
                    if (show)
                        
                    {
                        List {
                            
                            
                            ForEach(alphabet, id: \.self) { letter in
                                Section(header: Text(letter).multilineTextAlignment(.center).id(letter)){}
                                
                                
                                
                                
                                
                                if(selectedStrength == "Latein"){
                                    ForEach($plantSpecies.filter({ (plantSpecies) -> Bool in
                                        plantSpecies.scientificName.wrappedValue.prefix(1) == letter
                                    })) { contact in
                                        HStack {
                                            Text(contact.scientificName.wrappedValue)
                                            Spacer()
                                            
                                            if(containsInPlantArray(str: contact.scientificName.wrappedValue))
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
                                            Text(contact.germanName.wrappedValue)
                                            Spacer()
                                            
                                            if(containsInPlantArray(str: contact.germanName.wrappedValue))
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
                    }           else
                    {
                        
                        VStack{
                            List{
                                ForEach($plantSpecies){
                                    plantSpecies1 in
                                    
                                    HStack{
                                        if(selectedStrength == "Latein" ){
                                            Text(plantSpecies1.scientificName.wrappedValue)
                                            Spacer()
                                            if(containsInPlantArray(str: plantSpecies1.scientificName.wrappedValue))
                                            {
                                                CheckBoxView(checked: plantSpecies1.isChecked).disabled(true)
                                            }
                                            else {
                                                CheckBoxView(checked: plantSpecies1.isChecked)
                                            }
                   
                                        }
                                        if(selectedStrength == "Deutsch" ){
                                            Text(plantSpecies1.germanName.wrappedValue)
                                            Spacer()
                                            if(containsInPlantArray(str: plantSpecies1.scientificName.wrappedValue))
                                            {
                                                CheckBoxView(checked: plantSpecies1.isChecked).disabled(true)
                                            }
                                            else {
                                                CheckBoxView(checked: plantSpecies1.isChecked)
                                            }
                                           
                                        }
                                        
                                        
                                        
                                    }
                                }
                            }
                            .listStyle(GroupedListStyle())
                  
                            
                        }
                    }
                }
                
                
                NavigationLink(destination:  getDestination().onAppear{
                    longTimeSpeciesCencus.saveEntrysLongTerm()
                })
                {
                    Text("Save & geh zur nächsten Seite")
                }
                
            }.navigationBarBackButtonHidden(true)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                .onChange(of: searchText) { value in
                    if searchText.isEmpty && !isSearching {
                        show = true
                        
                        
                    }
                }
            
                .onChange(of: searchText) { value in
                    if !searchText.isEmpty {
                        show = false
                    }
                }
        }.toolbar {
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
        
        .navigationTitle("Schnellaufname").font(.title3)
        .listStyle(PlainListStyle())
        
        
        
        
        .onChange(of: searchText) {
            searchText in
            
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
    
    
    private func containsInPlantArray(str : String) -> Bool
    {
        
        
        
        if(selectedStrength == "Latein")
        {
            for i in listEntry.PlantArray
            {
                if(i.scientificName == str)
                {
                    return true
                }
            }
        }
        
        if(selectedStrength == "Deutsch")
        {
            for i in listEntry.PlantArray
            {
                if(i.germanName == str)
                {
                    return true
                }
            }
        }
        
        

        return false
    }
}


