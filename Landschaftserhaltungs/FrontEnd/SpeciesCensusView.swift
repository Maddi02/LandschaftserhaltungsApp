//
//  SpeciesCensusView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI

struct SpeciesCensusView: View {
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var selectedStrength = "FFH Mähwiese"
        let strengths = ["Deutsch", "Latein"]
    
    private let  width : Double = 250
    var description : String
    @State var fieldDescription : String = ""

    
    var body: some View {

        VStack{
            Text("Schnellaufnahme").font(Font.title).frame(maxWidth: .infinity , alignment: .topLeading)
            Text("\(description) ").font(Font.title3).frame(maxWidth: .infinity , alignment: .topLeading)
            HStack{
                
                Text("Platzennamen: ")
                
                Section {
                    Picker("", selection: $selectedStrength) {
                        ForEach(strengths, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }.frame(maxWidth: .infinity, alignment: .center)
                
            }
            Text("\(vm.time)")
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .background(.thinMaterial)
                .cornerRadius( 20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 4))
                .alert("Zeit abgelaufen", isPresented: $vm.showingAlert){
                Button("Okay", role: .cancel){
                    //Code
                }.scaledToFit()
                    
                }
            Slider(value: $vm.minutes, in: 1...10, step: 1)
                .padding()
                .frame(width: width)
                .disabled(vm.isActive)
                .animation(.easeInOut, value: vm.minutes)
            
            HStack(spacing: 50){
                Button("Start"){
                    vm.start(minutes: vm.minutes)
                }.disabled(vm.isActive)
                
                Button("Reset", action: vm.reset).tint(.red)
            }.frame(width: width)
                    
                    
                    
                    
       
        }.onReceive(timer){ _ in
            vm.updateCountdown()
        }
        Form{
            Section(header: Text("Description"))
            {
                TextField("Fügen Sie ein Beschreibung hinzu", text: $fieldDescription)
            }
            List {
                   Text("Hello World")
                   Text("Hello World")
                   Text("Hello World")
               }
        }
       
    }
}

struct SpeciesCensusView_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesCensusView(description: "Hello")
    }
}
