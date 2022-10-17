//
//  ContentView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        VStack {
            Group{
                Text("Willkommen zur digitalen Erfassung von Landschaftsfläche")
                    .font(.title)
                    .multilineTextAlignment(.center)
                Button(action: {
                    print("tapped!")
                }, label: {
                    Text("Starte jetzt")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(Color.blue)
                        .cornerRadius(15)
                        .padding()
                })
            }.frame(maxHeight: .infinity, alignment: .bottom)
        }
        .padding()
        .background(Image("NatureLaunch")
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
