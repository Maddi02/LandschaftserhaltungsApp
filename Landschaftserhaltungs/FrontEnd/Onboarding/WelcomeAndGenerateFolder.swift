//
//  WelcomeAndGenerateFolder.swift
//  Landschaftserhaltungs
//
//  Created by Marc Biehler on 19.12.22.
//

import SwiftUI

struct WelcomeAndGenerateFolder: View {
    var csvGenerator = CSVGenerator()
    @State var link = URL(string: "https://www.hackingwithswift.com")!
    
    var body: some View {
        
        VStack{
            
            Text("Herzlich Willkommen")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Mithilfe dieser App können Sie ihre Landschaftspflegeverträge verwalten und Landschaftsflächen digital erfassen.")
                .multilineTextAlignment(.center)
                .padding()
            
            
            Text("Bevor Sie fortfahren, müssen Sie beim ersten Start der App über den folgenden Button einen Ordner erzeugen (Hier werden sämtliche erzeugte und genutzte Dateien gespeichert).")
                .multilineTextAlignment(.center)
                .padding()
            
            Text("In diesem Ordner muss die CSV-Datei enthalten sein, die für die Artenliste importiert werden soll.")
                .multilineTextAlignment(.center)
                .padding()
            Text("Achten Sie darauf, dass die Spalten 1a, 1b, ... in der CSV-Datei ausschließlich mit einem großen X gekennzeichet werden (falls zutreffend).")
                .multilineTextAlignment(.center)
                .padding()
            
            Button("Ordner generieren"){
                link = csvGenerator.generateInitFolder()
                presentShareSheet()
            }.frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
        }
        
        
        
        
    }
    private func presentShareSheet(){
        let shareSheetVC = UIActivityViewController(activityItems: [link], applicationActivities:  [])
        UIApplication.shared.windows.first?.rootViewController?.present(shareSheetVC, animated: true, completion: nil)
    }
}

struct WelcomeAndGenerateFolder_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeAndGenerateFolder()
    }
}

