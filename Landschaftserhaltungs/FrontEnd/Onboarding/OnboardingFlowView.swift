//
//  ContentView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import SwiftUI

struct OnboardingFlowView: View {
    @State private var selection = 0
    @State private var buttonTitleNext = "Start"
    @State private var buttonTitleBack = "back"
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selection){
                WelcomeView().tag(0)
                FirstFeatureOverview().tag(1)
                SecondFeatureOverview().tag(2)
                ThirdFeatureOverview().tag(3)
                DoneOverview().tag(4)
                
            }
            .background(Image("NatureLaunch").ignoresSafeArea())
            .tabViewStyle(.page)
            .indexViewStyle(
                .page(backgroundDisplayMode: .always))
        }
        HStack{
            if(selection >= 1)
            {
                Button("back") {
                    print("pressed")
                    
                    withAnimation {
                        if(selection == 0)
                        {
                            buttonTitleNext = "Start"
                        }
                        if(selection >= 0 && selection < 5 )
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
            
            
            Button(buttonTitleNext) {
                
                
                withAnimation {
            
                    if(selection < 4)
                    {
                        buttonTitleNext = "Next"
                        selection+=1
                    }
                    
                }
            }.foregroundColor(.white)
                .frame(width: 100, height: 40)
                .background(Color.blue)
                .cornerRadius(15)
                .padding()
        }.padding(.leading, 50).padding(.trailing,50)
        
        Button("Skip Tutorial") {
            
            withAnimation {
                if(selection < 4)
                {
                    selection = 4
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFlowView()
    }
}

