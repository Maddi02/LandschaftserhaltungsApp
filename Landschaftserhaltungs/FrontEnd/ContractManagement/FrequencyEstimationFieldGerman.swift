//
//  FrequencyEstimationField.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI
struct test : View
{    @Environment(\.managedObjectContext) var moc

    @StateObject var listentry : PlantSpeciesItem
    static var state = " frrewfwf"
    var body: some View
    {
        Text(listentry.germanName ?? "Hhh")
        Text(listentry.frequency ?? "Hhh")
        Button("Test")
        {
            listentry.frequency = "Kuck Kuck"
            do{
                try moc.save()
       
                test.state = "Hallo"
               
                
            }
            catch{
                print("Hier \(error)")
            }
            
        }
        
        
    }
    
    public static func geti() -> String
    
    {
        return state
    }
}



struct FrequencyEstimationFieldGerman: View {
    @Environment(\.managedObjectContext) var moc
    @StateObject var listEntry : ListEntry
    @StateObject var userSettings = UserSettings()
    @State var checkedW = false
    var typeOfField : String
    let defaults = UserDefaults.standard
    let frequence = ["m", "w", "z" , "s" , "d"]
    @State var selection = ""
    @State private var showingAlert = false
    var types = ["Schnell-Aufnahme", "Genaue Aufnahme"]
       @State private var selectedType = "Schnell-Aufnahme"
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("Häufigkeitsschätzung").font(.title2).frame(maxWidth: .infinity, alignment: .top)
            
            Text("w - wenige")
            Text("m - mehrere")
            Text("z - zahlreich")
            Text("s - sehr viele")
            Text("d - dominant")
            
            
            if (typeOfField == "Anderes Biotop"){
                List()
                {
                    
                    ForEach(listEntry.PlantArrayLongTerm)
                    {
                        item in
                        Button {
                            print(item.germanName)
                            showingAlert = true
                        } label: {
                            HStack{
                                Text(item.germanName ?? " " )
                                Spacer()
                                Text(item.frequency ?? "")
                            }
                        }.alert(item.germanName ?? "NO Value", isPresented: $showingAlert, actions: {
                            Button("wenige") { saveLongTerm(item: item, value: "w") }
                            Button("mehrere") { saveLongTerm(item: item, value: "m") }
                            Button("zahlreich") { saveLongTerm(item: item, value: "z")}
                            Button("sehr viele") { saveLongTerm(item: item, value: "v")}
                            Button("dominat") { saveLongTerm(item: item, value: "d") }
                        })
                    }
                    
                    
                    
                }
            }
            
            
            else {
                
                VStack {
                    Picker("Please choose a color", selection: $selectedType) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    if(selectedType == "Schnell-Aufnahme")
                    {
                        
                        NavigationView{
                            List(test1(listEntry : listEntry)){
                                
                                 todoItem in
                                    NavigationLink(destination: test(listentry: todoItem)) {
                                        Text(todoItem.germanName ?? "")
                                    }
                                }
                                
                                
                                
                            }
                        }
                    
                    if(selectedType == "Genaue Aufnahme")
                    {
                        NavigationView {
                            
                            List(test1(listEntry: listEntry)) { todoItem in
                                NavigationLink(destination: test(listentry: todoItem).onAppear(perform: {
                                    print("Hallo Welt")
                                    selection = "WEEE"
                                    
                                }).onDisappear(perform: {
                                    print("Tschäuch Welt")
                                    selection = "WEEE"
                                    checkedW.toggle()
                                    up()
                                })) {
                                    Text(todoItem.germanName ?? " ")
                                    Text(todoItem.frequency ?? " ")
                                }
                            }.alert("HHH", isPresented: $checkedW, actions: {
                                
                            })
                        }
                        
                    }
                    
                    
                }
            }

        }
        
    }
    
    
    
    
    func saveShortTerm(item : PlantSpeciesItem, value : String)
    {
        item.frequency = value
        print(value)
        do{
            try moc.save()
            
        }
        catch{
            print("Hier \(error)")
        }
    }
    
    
    func saveLongTerm(item : PlantSpeciesLongTermItem, value : String)
    {
        item.frequency = value
        print(value)
        do{
            try moc.save()
            
        }
        catch{
            print("Hier \(error)")
        }
    }
    
    func up()
    {
        print("In upo")
        checkedW.toggle()
      
    }
    
    
    
    
    
    func test1(listEntry : ListEntry) -> [PlantSpeciesItem]
    {
        
        return listEntry.PlantArray.sorted( by : {lhs, rhs in
            return lhs.germanName ?? "a" < rhs.germanName ?? "b"
          })
    }
    
  
    
    
}

