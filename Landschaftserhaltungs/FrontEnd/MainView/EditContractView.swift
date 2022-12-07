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
            GeometryReader { geo in
                Form {
                    
                    Section(header: Text("Vertragsnehmer")) {
                        
                        
                        HStack {
                            HStack {
                                Text("Vorname")
                                Spacer()
                                
                            }
                            
                            HStack {
                                WrappedTextView(text: $appContract.firstName.toUnwrapped(defaultValue: ""), textDidChange: self.textDidChangeFirstName)
                                    .frame(height: heightFirstName ?? minHeightFirstName).background(Color.clear)
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
                    
                    Section(header: Text("Karte mit Vertragsflächen")) {
                        
                        Image(uiImage: appContract.picture ?? self.image)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .edgesIgnoringSafeArea(.all)
                        
                        Button {
                            self.isShownPhotoLibrary = true
                            
                        } label: {
                            HStack {
                                HStack{
                                    Image(systemName: "photo")
                                        .font(.system(size: 20))
                                    Text("Wähle ein Bild aus der Galerie aus")
                                }
                                .frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.horizontal)
                            }
                        }
                    }
                    Section(header: Text("")) {
                        Button{
                            
                            
                            
                            dataHandler.updateContract(appContract: appContract, contractDataModel: newContractDataModel, image:dataHandler.getImage(appContract: appContract), contractTermination: contractTermination, contractDeadline: contractDeadline)
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
                    }
    
                    
                }.navigationBarTitle(Text("Vertrag bearbeiten"))
            }.background(content: BackGroundGradient.getGradient)
            
        }.sheet(isPresented: $isShownPhotoLibrary){
            ImagePicker(changePicture: true, appContract: appContract, sourceType: .photoLibrary, selectedImage: self.$image)
            
        }
    }
}
