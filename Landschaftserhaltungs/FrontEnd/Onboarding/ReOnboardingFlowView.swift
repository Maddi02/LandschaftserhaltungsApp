//
// Created by Martin Hummel on 21.12.22.
//

import SwiftUI

struct ReOnboardingFlowView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var selection = 0
    @State private var buttonTitleNext = "Start"
    @State private var buttonTitleBack = "Zurück"
    @EnvironmentObject var appState : AppState
    private let defaults = UserDefaults.standard
    var body: some View {

        TabView(selection: $selection){
            Welcome().tag(0)
            GenerateFolder().tag(1)
            CustomiseProfile().tag(2)
            NewContract().tag(3)
            ManageContract().tag(4)
            ContractOverview().tag(5)
            RepeatOnboarding().tag(6)
            DoneOverview().tag(7)

        }

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
                        if(selection >= 0 && selection < 8 )
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

            if(selection < 7)
            {
                Button(buttonTitleNext) {
                    withAnimation {

                        if(selection < 7)
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
    }

}
