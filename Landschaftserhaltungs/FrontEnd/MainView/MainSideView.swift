//
//  MainSide.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import Foundation
import SwiftUI

struct MainSideView:  View {
    @ObservedObject var userSettings = UserSettings()
    @EnvironmentObject var appState : AppState
    @StateObject var dataHandler = DataHandler()
    @State private var showingSheet = false
    @StateObject var appContract = AppContract()
    @State var showProfile = false
    @State var showImpressum = false
    let defaults = UserDefaults.standard
    @State private var image = UIImage()
    var body: some View {
        //Verwalten
        
        VStack{
            GeometryReader { geometry in
                
                NavigationStack() {
                   
                    VStack {
                        Image(uiImage: self.image)
                            .resizable()
                            .scaledToFit()
                            .frame( maxHeight: 400, alignment: .center)
                        NavigationLink(destination: CreateNewContract()) {
                            Text("Neuen Vertrag anlegen")
                        }.frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .toolbar {
                                ToolbarItemGroup(placement: .navigationBarTrailing) {
                                    
                                    NavigationLink(destination: UserView().navigationBarBackButtonHidden(true)) {
                                        Text(Image(systemName: "person"))
                                    }
                                    
                                
                                }
                                ToolbarItemGroup(placement: .bottomBar) {
                                    Button("Impressum") {
                                        showImpressum.toggle()
                                    }.sheet(isPresented: $showImpressum)
                                    {
                                        ImpressumView()
                                    }
                                }
                            }
                        
                        NavigationLink(destination: ManageContractView()) {
                            Text("Verträge verwalten")
                        }.frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)


                        
                  
                      
                     
                    }.frame(width: (geometry.size.width), height: geometry.size.height, alignment: .center)
                    
                        .onAppear(perform: {
               
                          //  userSettings.loadImage()
                            self.image = userSettings.getImage()
                        })
                }
        
                
            }
            .padding(.top)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            ).edgesIgnoringSafeArea(.all)
     
        }

    }
    
}

