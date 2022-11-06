//
//  ListItemContractArea.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 04.11.22.
//

import SwiftUI

struct ListItemContractArea: Hashable,  View {

    

    
    var description: String
    var date : Date
    var typ : String
    
    var body: some View {

        VStack{
            
            HStack {
                
                HStack {
                    Text("Bezeichnung")
                    Spacer()
                }
                HStack {
                    
                  Text("\(description)")
                     
                }
            }.padding(.all)
            
            
            
            HStack {
                HStack {
                    Text("Datum")
                    Spacer()
                }
                HStack{
                    Text("\(date.toString())")
                }
            }.padding(.all)
            
            
            HStack{
                
                HStack{
                    Text("Typ: ")
                    Spacer()
                }
                
                HStack{
                    Text("\(typ)")
                }
                
                
            }.padding(.all)
            
            
            
            HStack{
                
                HStack{
                    Text("Gezählte Pflanzenarten")
                    Spacer()
                }
                
                HStack{
                    /*
                    WrappedTextView(text: $username.toUnwrapped(defaultValue: ""), textDidChange: self.textDidChangeLocation)
                        .frame(height: heightLocation ?? minHeightLocation).background(Color.clear)
                    */
                }
                
                
            }.padding(.all)
            
            
            
        }.padding(.all)
            
            
        }
            
        }




