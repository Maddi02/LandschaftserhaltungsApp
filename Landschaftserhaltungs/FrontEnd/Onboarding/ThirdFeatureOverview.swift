//
//  ThirdFeatureOverview.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import SwiftUI

struct ThirdFeatureOverview: View {
    var csvGenerator = CSVGenerator()
    @State var link = URL(string: "https://www.hackingwithswift.com")!
    
    var body: some View {
        
        VStack{
            Text("\n \n \n Generieren Sie jetzt Ihren App Ordner in welchen Sie die CSV mit den Pflanzenarten importieren können.\n").multilineTextAlignment(.center)
            
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

struct ThirdFeatureOverview_Previews: PreviewProvider {
    static var previews: some View {
        ThirdFeatureOverview()
    }
}
