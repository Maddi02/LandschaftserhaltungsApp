//
//  MainSide.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import Foundation
import SwiftUI

struct MainSideView:  View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var appState : AppState
    var body: some View {
        //Verwalten
        
        VStack{
            GeometryReader { geometry in
          
                NavigationView() {
                        VStack {
                            NavigationLink(destination: CreateNewContract()) {
                                Text("Neuen Vertrag anlegen")
                            }.foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.5))
                                .navigationTitle("Menu")
                                .frame(alignment: .topLeading)
                                
                            
                            NavigationLink(destination: ManageContractView()) {
                                Text("Verträge verwalten")
                            }.foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.5))
                            
                            NavigationLink(destination: ExpiredContractView()) {
                                Text("Auslaufende Verträge")
                            }.foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.5))
                            
                        }.frame(width: (geometry.size.width), height: geometry.size.height, alignment: .center)
                            .fullBackground(imageName: "NatureLaunch")
                      
                    
                }
                
            
            }
            // Neu anlegen
            // Auslaufende Verträge
            
            
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



struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MainSideView()
    }
}

