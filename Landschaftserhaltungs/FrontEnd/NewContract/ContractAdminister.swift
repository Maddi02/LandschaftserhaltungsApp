//
//  ContractAdminister.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 02.11.22.
//

import SwiftUI




 struct ContractAdminister: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    private  let pdf = PDFCreatorDiffrentBiotop()
    @ObservedObject var dataHandler : DataHandler 
    @State var listEntry : ListEntry = ListEntry()
    @State var filteredContracts : AppContract
    @State var description : String = ""
    @State private var action: Int? = 0
    @State private var showingOptions = false
    @State private var selection = "None"
    @State private var showingAlert = false
    @State private var showingActionSheet = false
    @State private var typOfField = ""
     let csvGenerator = CSVGenerator()
     @State var link = URL(string: "https://www.hackingwithswift.com")!
    var body: some View {
        Text("Vetragsübersicht").font(.title2).frame(maxWidth: .infinity, alignment: .leading)
        ContractListItem(firstName: filteredContracts.firstName ?? "Unknown", lastName: filteredContracts.lastName ?? "Unknwon" , operationNumber: filteredContracts.operationNumber ?? "Unknown", contractTermination:  filteredContracts.contractTermination?.toString() ?? Date().toString(), endOfContract: filteredContracts.contractTermination?.getEndOfContract(date: filteredContracts.contractTermination ?? Date()) ?? Date().toString() , image: filteredContracts.picture ?? UIImage(imageLiteralResourceName: "HFULogo"), deadline: filteredContracts.deadline?.toString() ?? Date().toString(), dataHandler: dataHandler).frame(maxWidth: .infinity, alignment: .top)
        
        
        
        VStack{

            Text("Vetragsflächen:").font(.title2).frame(maxWidth: .infinity, alignment: .leading)
            Button(action: {
                showingOptions.toggle()
                
            }){
                Image(systemName: "plus")
            }.frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing,30).padding(.bottom,10) .sheet(isPresented: $showingOptions)
            {
                
                CreateNewPerpetration( dataHandler: dataHandler, appContact: filteredContracts)
            }
            
            
        }
        VStack{
            List()
            {
                
                ForEach(filteredContracts.ContactArray, id: \.self)
                {
                    
                    list in
                    
                    Button{
                        description = list.detailDescription ?? "Unknown"
                        showingActionSheet.toggle()
                        typOfField = list.descriptionField ?? "Unknown"
                        listEntry = list.self
                
                        
                    }
   
                
                
                label: {
                        
                        
                        ListItemContractArea(description: list.detailDescription ?? "Unknown", date: list.dateOfObservation ?? Date(), typ: list.descriptionField ?? "Unknown").tint(.black)
                        
                    }
                    
                } .onDelete(perform: delete).alert("Vertrag wurde gelöscht", isPresented: $showingAlert) {
                }
                
            }.confirmationDialog("Wähle die Art der Zählung aus", isPresented: $showingActionSheet, titleVisibility: .visible) {
                
                
            
                NavigationLink(destination: SpeciesCensusView( listEntry: listEntry, typeOfField: typOfField, description:  self.description )) {
                        Button("Artenzählung")
                        {
                            
                        }
                    }
                

                NavigationLink(destination: FrequencyEstimationField()) {
                    Button("Häufigkeitsschätzung")
                    {

                    }
                }
                if(typOfField == "FFH Mähwiese"){
                    NavigationLink(destination: ExportPreviewPDFFFH(listEntry: listEntry)) {
                        Button("PDF Exportieren")
                        {
                            
                        }
                    }
                }
                else {
                    NavigationLink(destination: ExportPreviewPDFOtherBiotop(listEntry: listEntry).onAppear(perform: {pdf.generatePdf(listEntry: listEntry)})) {
                        Button("PDF Exportieren")
                        {
                            
                        }
                    }
                }
                
               
            
            
                
                Button("CSV Exportieren")
                {
                    link = csvGenerator.generateAndGetUrl(listEntry: listEntry)
                    presentShareSheet()
                }
                
                NavigationLink(destination: EditListItemContractArea(type: typOfField, listEntry: listEntry)) {
                    Button(" Information Bearbeiten")
                    {
                        
                    }
                }

                    
                 
               
                
                
                
            }
        }
    }
    
    func delete(at offsets : IndexSet )
    {
        showingAlert = true
        for offset in offsets{
            let item = filteredContracts.ContactArray[offset]
            moc.delete(item)
        }
        do{
            try moc.save()
            
            
        } catch{
            
        }
    }
     private func presentShareSheet(){
        // pdf.generatePdf(listEntry: listEntry)
     
         let shareSheetVC = UIActivityViewController(activityItems: [link], applicationActivities:  [])
         UIApplication.shared.windows.first?.rootViewController?.present(shareSheetVC, animated: true, completion: nil)
     }

     func test(str : String)
     {
         print(str)
     }
     

}

