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
            
            Group{
                Text("Herzlich Willkommen\n")
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            Group{
                Text("Mithilfe dieser App können Sie ihre Landschaftspflegeverträge verwalten und Landschaftsflächen digital erfassen.\n")
                    .multilineTextAlignment(.center)
            }
            Group{
                Text("Bevor Sie fortfahren, müssen Sie beim ersten Start der App über den folgenden Button einen Ordner erzeugen (Hier werden sämtliche erzeugte und genutzte Dateien gespeichert).\n")
                    .multilineTextAlignment(.center)
            }
            Text("In diesem Ordner muss die CSV-Datei enthalten sein, die für die Artenliste importiert werden soll.\n").multilineTextAlignment(.center)
            
            Button("Ordner generieren"){
                link = csvGenerator.generateInitFolder()
                presentShareSheet()
            }
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

