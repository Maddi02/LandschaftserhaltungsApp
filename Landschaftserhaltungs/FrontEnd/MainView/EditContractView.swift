//
//  EditContract.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 25.10.22.
//

import SwiftUI
import CoreData
struct EditContractView: View {
    
    @ObservedObject var appContract : AppContract // in any case of trubble thing about this line
    
    @State private var isShownPhotoLibrary = false
    @State private var image = UIImage()
    @State var contractTermination : Int
    @State var showWheelPicker: Bool = false
    @State  var contractDeadline : Date
    @State  var showActionSheet : Bool = false
    @State  var showDocumentPicker : Bool = false
    @State private var firstname = String()
    @State private var textStyle = UIFont.TextStyle.body
    @State private var heightContractNumber: CGFloat?
    @State private var heightContractPurpose: CGFloat?
    @State private var heightContractMeasures: CGFloat?
    @State private var heightContractManagementRequirements: CGFloat?
    @State private var heightContractParticularities: CGFloat?
    @State private var heightStreet: CGFloat?
    @State private var heightFirstName: CGFloat?
    @State private var heightLastName: CGFloat?
    @State private var heightLocation: CGFloat?
    @StateObject var newContractDataModel = NewContractDataModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var dataHandler : DataHandler
    var manageContractView = ManageContractView()
    let minHeightContractNumber: CGFloat = 30
    let minHeightContractPurpose: CGFloat = 30
    let minHeightContractMeasures: CGFloat = 30
    let minHeightContractManagementRequirements: CGFloat = 30
    let minHeightContractParticularities: CGFloat = 30
    let minHeightStreet: CGFloat = 30
    let minHeightFirstName: CGFloat = 30
    let minHeightLastName: CGFloat = 30
    let minHeightLocation: CGFloat = 30
    
    private func textDidChangeContractNumber(_ textView: UITextView) {
        self.heightContractNumber = max(textView.contentSize.height, minHeightContractNumber)
    }
    private func textDidChangeContractPurpose(_ textView: UITextView) {
        self.heightContractPurpose = max(textView.contentSize.height, minHeightContractPurpose)
    }
    private func textDidChangeContractMeasures(_ textView: UITextView) {
        self.heightContractMeasures = max(textView.contentSize.height, minHeightContractMeasures)
    }
    private func textDidChangeContractManagementRequirements(_ textView: UITextView) {
        self.heightContractManagementRequirements = max(textView.contentSize.height, minHeightContractManagementRequirements)
    }
    private func textDidChangeContractParticularities(_ textView: UITextView) {
        self.heightContractParticularities = max(textView.contentSize.height, minHeightContractParticularities)
    }
    private func textDidChangeStreet(_ textView: UITextView) {
        self.heightStreet = max(textView.contentSize.height, minHeightStreet)
    }
    private func textDidChangeFirstName(_ textView: UITextView) {
        self.heightFirstName = max(textView.contentSize.height, minHeightFirstName)
        
    }
    private func textDidChangeLastName(_ textView: UITextView) {
        self.heightLastName = max(textView.contentSize.height, minHeightLastName)
    }
    private func textDidChangeLocation(_ textView: UITextView) {
        self.heightLocation = max(textView.contentSize.height, minHeightLocation)
    }
    var body: some View {
        
        NavigationView {
            VStack{
                VStack{
                    GeometryReader { geo in
                        
                        Form {
                            
                            Group{
                                Section(header: Text("Vertragsnehmer")) {
                                    
                                    
                                    HStack {
                                        HStack {
                                            Text("Vorname")
                                            Spacer()
                                            
                                        }
                                        
                                        HStack {
                                            WrappedTextView(text: $appContract.firstName.toUnwrapped(defaultValue: ""), textDidChange: self.textDidChangeFirstName)
                                                .frame(height: heightFirstName ?? minHeightFirstName).background(Color.clear)
                                            
                                        }    .toolbar{
                                            ToolbarItemGroup(placement: .keyboard)
                                            {
                                                Button("hh")
                                                {
                                                    
                                                }
                                            }
                                        }
                                    
                                        
                                    }
                                    HStack {
                                        HStack {
                                            Text("Nachname")
                                            Spacer()
                                            
                                        }
                                        HStack {
                                            WrappedTextView(text: $appContract.lastName.toUnwrapped(defaultValue: ""), textDidChange: self.textDidChangeLastName)
                                                .frame(height: heightLastName ?? minHeightLastName).background(Color.clear)
                                        }
                                        
                                    }
                                }
                                Section(header: Text("Kontakt-Adresse")) {
                                    
                                    HStack {
                                        HStack {
                                            Text("Straße")
                                            Spacer()
                                            
                                        }
                                        HStack {
                                            WrappedTextView(text: $appContract.street.toUnwrapped(defaultValue: ""), textDidChange: self.textDidChangeStreet(_:))
                                                .frame(height: heightStreet ?? minHeightStreet).background(Color.clear)
                                        }
                                        
                                    }
                                    
                                    HStack {
                                        HStack {
                                            Text("Ort")
                                            Spacer()
                                            
                                        }
                                        HStack {
                                            WrappedTextView(text: $appContract.plzName.toUnwrapped(defaultValue: ""), textDidChange: self.textDidChangeLocation)
                                                .frame(height: heightLocation ?? minHeightLocation).background(Color.clear)
                                        }
                                        
                                    }
                                    
                                    HStack {
                                        HStack {
                                            Text("PLZ")
                                            Spacer()
                                            
                                        }
                                        HStack {
                                            TextView(text: $appContract.plz.toUnwrapped(defaultValue: ""), textStyle: $textStyle).background(Color.clear)
                                        }
                                        
                                    }
                                    
                                    HStack {
                                        HStack {
                                            Text("Land")
                                            Spacer()
                                            
                                        }
                                        HStack {
                                            TextView(text: $appContract.country.toUnwrapped(defaultValue: ""), textStyle: $textStyle).background(Color.clear)
                                        }
                                        
                                    }
                                    
                                    
                                    HStack {
                                        HStack {
                                            Text("Mobil")
                                            Spacer()
                                            
                                        }
                                        HStack {
                                            TextView(text: $appContract.mobile.toUnwrapped(defaultValue: ""), textStyle: $textStyle).frame(maxWidth: .infinity).background(Color.clear)
                                        }
                                        
                                    }
                                }
                                Section(header: Text("Vertragsinformationen")) {
                                    HStack
                                    {
                                        Text("Vertragsabschluss")
                                        Spacer()
                                        Button(String(contractTermination))
                                        {
                                            showWheelPicker.toggle()
                                        }
                                        .buttonStyle(BorderedButtonStyle())
                                        .padding(5)
                                        .foregroundColor(.black)
                                        .cornerRadius(5)
                                    }
                                    CollapsableWheelPicker(
                                        "Vertragsabschluss",
                                        showsPicker: $showWheelPicker,
                                        selection: $contractTermination
                                    ) {
                                        ForEach(newContractDataModel.years, id: \.self) {
                                            Text(String($0)).tag($0)
                                        }
                                    }
                                    
                                    HStack {
                                        HStack {
                                            Text("Vorgangsnummer")
                                            Spacer()
                                            
                                        }
                                        HStack {
                                            TextView(text: $appContract.operationNumber.toUnwrapped(defaultValue: ""), textStyle: $textStyle).background(Color.clear)
                                        }
                                        
                                    }
                                    
                                    VStack {
                                        HStack {
                                            Text("Vertragszweck")
                                            Spacer()
                                            
                                        }
                                        HStack {
                                            WrappedTextView(text: $appContract.contractPurpose.toUnwrapped(defaultValue: ""), textDidChange: self.textDidChangeContractPurpose)
                                                .frame(height: heightContractPurpose ?? minHeightContractPurpose).background(Color.clear)
                                        }
                                        
                                    }
                                    
                                    VStack {
                                        HStack {
                                            Text("Maßnahmen")
                                            Spacer()
                                            
                                        }
                                        HStack {
                                            WrappedTextView(text: $appContract.measures.toUnwrapped(defaultValue: ""), textDidChange: self.textDidChangeContractMeasures)
                                                .frame(height: heightContractMeasures ?? minHeightContractMeasures).background(Color.clear)
                                        }
                                        
                                    }
                                    
                                    VStack {
                                        HStack {
                                            Text("Bewirtschaftungsauflagen")
                                            Spacer()
                                            
                                        }
                                        HStack {
                                            WrappedTextView(text: $appContract.managementRequirements.toUnwrapped(defaultValue: ""), textDidChange: self.textDidChangeContractManagementRequirements)
                                                .frame(height: heightContractManagementRequirements ?? minHeightContractManagementRequirements).background(Color.clear)
                                        }
                                    }
                                    VStack {
                                        DatePicker(selection: $contractDeadline,
                                                   displayedComponents: [.date],
                                                   label: { Text("Frist") })
                                        
                                    }
                                    
                                }
                                Section(header: Text("Vertragsinformationen")) {
                                }
                                
                                
                                Section(header: Text("Besonderheiten"))
                                {
                                    HStack {
                                        WrappedTextView(text: $appContract.particularities.toUnwrapped(defaultValue: ""), textDidChange: self.textDidChangeContractParticularities)
                                            .frame(height: heightContractParticularities ?? minHeightContractParticularities).background(Color.clear)
                                    }
                                }
                            }
                            
                            Section(header: Text("Übersichtskarte")) {
                                Image(uiImage: self.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .edgesIgnoringSafeArea(.all)
                                
                                
                                
                                
                                Button()
                                {
                                    showActionSheet.toggle()
                                } label: {
                                    HStack{
                                        Image(systemName: "map.fill")
                                            .font(.system(size: 20))
                                        Text("Übersichtskarte auswählen")
                                        
                                    } .frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                       
                                }.confirmationDialog("Bildquelle auswählen", isPresented: $showActionSheet, titleVisibility: .visible) {
                                    
                                    
                                    Button()
                                    {
                                        showDocumentPicker.toggle()
                                    }label: {
                                        Text("Bild aus Datein auswählen")
                                    }
                                    
                                    
                                    
                                    
                                    
                                    Button {
                                        self.isShownPhotoLibrary = true
                                        
                                    } label: {
                                        HStack {
                                            HStack{
                                                Text("Bild aus der Galerie auswählen")
                                            }
                                            
                                        }
                                    }
                                } .listRowBackground(Color.blue)
                                .sheet(isPresented: $showDocumentPicker)
                                {
                                    DocumentPicker(content: self.$image)
                                }
                            
                            }
                            Section(header: Text("")) {
                                Button{
                                    
                                    
                                    
                                    dataHandler.updateContract(appContract: appContract, contractDataModel: newContractDataModel, image:self.image, contractTermination: contractTermination, contractDeadline: contractDeadline)
                                    dataHandler.fetchAppContract()
                                    presentationMode.wrappedValue.dismiss()
                                }
                                
                                
                            label: {
                                HStack {
                                    
                                    Text("Speichern")
                                }
                            }
                                
                                
                            .frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .listRowBackground(Color.blue)
                            }
                            
                            
                            
                        }
                    }
                    }.navigationTitle(Text("Vertrag bearbeiten"))
                        
                    
                    
                }
                
                
                
                
            }
            .sheet(isPresented: $isShownPhotoLibrary){
                ImagePicker(changePicture: true, appContract: appContract, sourceType: .photoLibrary, selectedImage: self.$image)
                
            }
        
    }
        
        func dismissKeyboard() {
            UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.endEditing(true) // 4
        }
    }
