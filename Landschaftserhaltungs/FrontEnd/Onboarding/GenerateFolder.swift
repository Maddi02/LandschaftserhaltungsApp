//
//  GenerateFolder.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 24.12.22.
//

import Foundation
import SwiftUI
struct GenerateFolder : View
{
    var csvGenerator = CSVGenerator()
    @State var link = URL(string: "https://www.hackingwithswift.com")!
   
    var body : some View {
        
        
        VStack{
            
            Text("Ordner generieren").font(.title)
            
            
            Text("Bevor Sie fortfahren, müssen Sie beim ersten Start der App über den folgenden Button einen Ordner erzeugen (Hier werden sämtliche erzeugte und genutzte Dateien gespeichert).")
                .multilineTextAlignment(.center)
                .padding()
                .font(.system(size: 14))
            
            Text("In diesem Ordner muss die CSV-Datei enthalten sein, die für die Artenliste importiert werden soll. Hinweis: Google Sheets bietet die Möglichkeit eine CSV - Datei mit kommagetrennten Werten zu downloaden.")
                .multilineTextAlignment(.center)
                .padding()
                .font(.system(size: 14))
            Text("Achten Sie darauf, dass die Spalten 1a, 1b .. in der CSV-Datei ausschließlich mit einem großen X gekennzeichet werden (falls zutreffend).")
                .multilineTextAlignment(.center)
                .padding(.leading)
                .font(.system(size: 14))
            
            Button("Ordner generieren"){
                link = csvGenerator.generateInitFolder()
                presentShareSheet()
            }.frame(minWidth: 0, maxWidth: .infinity , minHeight: 10 , maxHeight: 30)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.bottom)
                .padding(.top)
            
        }
    }
    private func presentShareSheet(){
        let shareSheetVC = UIActivityViewController(activityItems: [link], applicationActivities:  [])
        UIApplication.shared.windows.first?.rootViewController?.present(shareSheetVC, animated: true, completion: nil)
    }
    
}
