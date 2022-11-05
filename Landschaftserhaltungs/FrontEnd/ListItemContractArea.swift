//
//  ListItemContractArea.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 04.11.22.
//

import SwiftUI

struct ListItemContractArea: Hashable,  View {

    

    
    private var username: String = "HHH"
    var test : Int = 0
    private var heightLocation: CGFloat = 0
   
   // @State var contractTerminatation : Date = Date()
    let minHeightLocation: CGFloat = 30

    init()
    {
        username = "hhferubcgor"
    }
    
    var body: some View {

        VStack{
            
            HStack {
                
                HStack {
                    Text("Bezeichnung")
                    Spacer()
                }
                HStack {
                    /*
                    WrappedTextView(text: $username.toUnwrapped(defaultValue: ""), textDidChange: self.textDidChangeLocation)
                        .frame(height: heightLocation ?? minHeightLocation).background(Color.clear)
                     */
                }
            }.padding(.all)
            
            
            
            HStack {
                HStack {
                    Text("Datum")
                    Spacer()
                }
                HStack{
                /*
                    DatePicker(
                        "",
                        selection: $contractTerminatation,
                        displayedComponents: [.date]
                    ).padding(.trailing)
                    */
                }
            }.padding(.all)
            
            
            HStack{
                
                HStack{
                    Text("Typ: ")
                    Spacer()
                }
                
                HStack{
                    /*
                    WrappedTextView(text: $username.toUnwrapped(defaultValue: ""), textDidChange: self.textDidChangeLocation)
                        .frame(height: heightLocation ?? minHeightLocation).background(Color.clear)
                    */
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




