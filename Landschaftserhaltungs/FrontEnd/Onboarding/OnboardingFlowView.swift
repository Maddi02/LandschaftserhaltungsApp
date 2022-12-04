//
//  ContentView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import SwiftUI

struct OnboardingFlowView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var selection = 0
    @State private var buttonTitleNext = "Start"
    @State private var buttonTitleBack = "Zurück"
    @EnvironmentObject var appState : AppState
    private let defaults = UserDefaults.standard
    var body: some View {
        
        TabView(selection: $selection){
            WelcomeView().tag(0)
            FirstFeatureOverview().tag(1)
            SecondFeatureOverview().tag(2)
            ThirdFeatureOverview().tag(3)
            FourthFeatureOverview().tag(4)
            DoneOverview().tag(5)
            
        }
        .background(BackGroundGradient.getGradient())
        .tabViewStyle(.page)
        .indexViewStyle(
            .page(backgroundDisplayMode: .always))
        
        HStack{
            if(selection >= 1)
            {
                Button("Zurück") {
                    withAnimation {
                        if(selection == 0)
                        {
                            buttonTitleNext = "Start"
                        }
                        if(selection >= 0 && selection < 6 )
                        {
                            selection-=1
                        }
                        
                    }
                }.foregroundColor(.white)
                    .frame(width: 100, height: 40)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .padding()
            }
            
            if(selection < 5)
            {
                Button(buttonTitleNext) {
                    withAnimation {
                        
                        if(selection < 5)
                        {
                            buttonTitleNext = "Weiter"
                            selection+=1
                        }
                        
                    }
                }.foregroundColor(.white)
                    .frame(width: 100, height: 40)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .padding()
            }
        }.padding(.leading, 50).padding(.trailing,50)
        
        if(selection < 5)
        {
            Button("Tutorial überspringen") {
                
                withAnimation {
                    if(selection < 5)
                    {
                        
                        appState.hasOnboarded = true
                        UserDefaults.standard.set(appState.hasOnboarded, forKey: "onBoarded")
                    }
                    
                }
            }
            .foregroundColor(.white)
            .frame(width: 230, height: 40)
            .background(Color.blue)
            .cornerRadius(15)
            .padding()
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFlowView()
    }
}

