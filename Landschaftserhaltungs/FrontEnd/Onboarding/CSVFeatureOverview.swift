//
//  SecondFeatureOverview.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 17.10.22.
//

import SwiftUI

struct CSVFeatureOverview: View {
    var csvGenerator = CSVGenerator()
    @State var link = URL(string: "https://www.hackingwithswift.com")!
    
    var body: some View {
        
        VStack{
            Text("Generieren Sie hier ihren App Ordner in welchen Sie die csv Importieren können").multilineTextAlignment(.center)
            
            Button("generieren"){
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

struct CSVFeatureOverview_Previews: PreviewProvider {
    static var previews: some View {
        CSVFeatureOverview()
    }
}
