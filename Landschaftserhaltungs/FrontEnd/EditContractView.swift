//
//  EditContract.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 25.10.22.
//

import SwiftUI
import CoreData
struct EditContractView: View {
    
    @State var appContract : AppContract
    var dataHandler : DataHandler
    @State private var isShownPhotoLibrary = false
    @State private var image = UIImage()
    @StateObject var newContractDataModel = NewContractDataModel()
    var manageContractView = ManageContractView()
    @State  var contractTerminatation : Date
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var firstname = String()
    @State private var textStyle = UIFont.TextStyle.body
    let minHeight: CGFloat = 30
    @State private var height: CGFloat?
    private func textDidChange(_ textView: UITextView) {
            self.height = max(textView.contentSize.height, minHeight)
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
                                WrappedTextView(text: $appContract.firstName.toUnwrapped(defaultValue: ""), textDidChange: self.textDidChange)
                                            
                               // TextView(text: $appContract.firstName.toUnwrapped(defaultValue: ""), textStyle: $textStyle) //TODO replace lastname with firstname
                            }
                            
                        }
                        HStack {
                            HStack {
                                Text("Nachname")
                                Spacer()
                                
                            }
                            HStack {
                                WrappedTextView(text: $appContract.lastName, textDidChange: self.textDidChange)
                            }
                            
                        }
                    }.frame(height: height ?? minHeight)
                    Section(header: Text("Kontakt-Adresse")) {
                        
                        HStack {
                            HStack {
                                Text("Straße")
                                Spacer()
                                
                            }
                            HStack {
                                TextView(text: $appContract.street.toUnwrapped(defaultValue: ""), textStyle: $textStyle)
                            }
                            
                        }
                        
                        HStack {
                            HStack {
                                Text("Ort")
                                Spacer()
                                
                            }
                            HStack {
                                TextView(text: $appContract.plzName.toUnwrapped(defaultValue: ""), textStyle: $textStyle)
                            }
                            
                        }
                        
                        HStack {
                            HStack {
                                Text("PLZ")
                                Spacer()
                                
                            }
                            HStack {
                                TextView(text: $appContract.plz.toUnwrapped(defaultValue: ""), textStyle: $textStyle)
                            }
                            
                        }
                        
                        HStack {
                            HStack {
                                Text("Land")
                                Spacer()
                                
                            }
                            HStack {
                                TextView(text: $appContract.country.toUnwrapped(defaultValue: ""), textStyle: $textStyle)
                            }
                            
                        }
                        
                        
                        HStack {
                            HStack {
                                Text("Mobil")
                                Spacer()
                                
                            }
                            HStack {
                                TextView(text: $appContract.mobile.toUnwrapped(defaultValue: ""), textStyle: $textStyle).frame(maxWidth: .infinity)
                            }
                            
                        }
                    }
                    Section(header: Text("Vertragsinformationen")) {
                        DatePicker(selection: $contractTerminatation,
                                   displayedComponents: [.date],
                                   label: { Text("Vertragsabschluss") })
                        
                        HStack {
                            HStack {
                                Text("Vorgangsnummer")
                                Spacer()
                                
                            }
                            HStack {
                                TextView(text: $appContract.operationNumber.toUnwrapped(defaultValue: ""), textStyle: $textStyle)
                            }
                            
                        }
                        
                        HStack {
                            HStack {
                                Text("Vertragszweck")
                                Spacer()
                                
                            }
                            HStack {
                                TextView(text: $appContract.contractPurpose.toUnwrapped(defaultValue: ""), textStyle: $textStyle)
                            }
                            
                        }
                        
                        HStack {
                            HStack {
                                Text("Maßnahmen")
                                Spacer()
                                
                            }
                            HStack {
                                TextView(text: $appContract.measures.toUnwrapped(defaultValue: ""), textStyle: $textStyle)
                            }
                            
                        }
                        
                        HStack {
                            HStack {
                                Text("Bewirtschaftungsauflagen")
                                Spacer()
                                
                            }
                            HStack {
                                TextView(text: $appContract.managementRequirements.toUnwrapped(defaultValue: ""), textStyle: $textStyle)
                            }
                            
                        }

                    }
                    Section(header: Text("Besonderheiten"))
                    {
                        Section(header: Text("")) {
                            TextField(appContract.particularities ?? "unknown", text: $newContractDataModel.particularities,axis: .vertical).frame(minHeight: 50)
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
                           
                            dataHandler.updateContract(appContract: appContract, contractDataModel: newContractDataModel, image: self.image, contractTermination: self.contractTerminatation)
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
                    Button{
                        print("Sollte ein Feldbegehungsformular öffnen")
                    }
                label: {
                    HStack {
                        Text("Hinzufügen einer Feldbegehung")
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
            ImagePicker(appContract: appContract, sourceType: .photoLibrary, selectedImage: self.$image)
            
        }
    }
}

/*
 struct EditContract_Previews: PreviewProvider {
 static var previews: some View {
 EditContract()
 }
 }
 */
