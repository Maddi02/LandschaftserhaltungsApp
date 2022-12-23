//
//  TimerView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 08.11.22.
//

import SwiftUI

struct TimerView: View {
    var  sheetSelectPlants : SheetSelectPlantsShortTerm
    @StateObject private var vm = ViewModel()
    private let  width : Double = 250
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        Text("\(vm.time)")
                    .font(.system(size: 50, weight: .medium, design: .rounded))
                    .background(.thinMaterial)
                    .cornerRadius( 20)
                
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 4))
                    .alert("Zeit abgelaufen", isPresented: $vm.showingAlert){
                        Button("Okay", role: .cancel){
                            //Code
                        }.scaledToFit()
                        
                    }
                Slider(value: $vm.minutes, in: 1...10, step: 1)
                
                    .frame(width: width)
                    .disabled(vm.isActive)
                    .animation(.easeInOut, value: vm.minutes)
                
                HStack(spacing: 50){
                    Button("Start"){
                        sheetSelectPlants.selectionActivate()
                        vm.start(minutes: vm.minutes)
                    }.disabled(vm.isActive)
                        .frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Button("Reset")
                    {
                        vm.reset()
                        sheetSelectPlants.selectionDeactivate()
                    }.frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }.frame(width: width).padding(.top,20)
                
                
                
                
                
                    .onReceive(timer){ _ in
                        vm.updateCountdown()
                    }
            }
    }





