//
//  ImpressumView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 18.11.22.
//

import SwiftUI


struct ImpressumGerman : View
{
    
    var body: some View
    {
        VStack{
            Text("Abgaben gemäß § 5 TMG").font(Font.headline.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Martin Hummel").frame(maxWidth: .infinity, alignment: .leading).padding(.top)
            Text("Robert Gerwig Platz 1").frame(maxWidth: .infinity, alignment: .leading)
            Text("78120 Furtwangen im Schwarzwald").frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Kontakt").font(Font.headline.weight(.bold)).padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Telefon: [Telefonnummer]").frame(maxWidth: .infinity, alignment: .leading).padding(.top)
            Text("E-Mail: martin.hummel@hs-furtwangen.de").frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Verbraucherstreitbeilegung/Universalschlichtungsstelle").font(Font.headline.weight(.bold)).padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Wir sind nicht bereit oder verpflichtet, an Streitbeilegungsverfahren vor einer Verbraucherschlichtungsstelle teilzunehmen.").frame(maxWidth: .infinity, alignment: .leading)
            
            
            
            
            
        }
    }
}


struct ImpressumEnglish : View
{
    
    var body: some View
    {
        VStack{
            Text("Levies according to § 5 TMG").font(Font.headline.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Martin Hummel").frame(maxWidth: .infinity, alignment: .leading).padding(.top)
            Text("Robert Gerwig Platz 1").frame(maxWidth: .infinity, alignment: .leading)
            Text("78120 Furtwangen im Schwarzwald").frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Contract").font(Font.headline.weight(.bold)).padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("mobile: [Telefonnummer]").frame(maxWidth: .infinity, alignment: .leading).padding(.top)
            Text("E-Mail: martin.hummel@hs-furtwangen.de").frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Consumer dispute resolution/universal arbitration board").font(Font.headline.weight(.bold)).padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("We are not willing or obliged to participate in dispute resolution proceedings before a consumer arbitration board.").frame(maxWidth: .infinity, alignment: .leading)
            
            
            
            
            
        }
    }
}
struct ImpressumView: View {
    @State private var selectedLanguage = "Deutsch"
    let  language = ["Deutsch", "English"]
    @Environment(\.dismiss) var dismiss
    var body: some View {



        VStack{
            Text("Impressum")  .font(Font.headline.weight(.bold))
            VStack{
                
   
                Section {
                    Picker("Sprache", selection: $selectedLanguage) {
                        ForEach(language, id: \.self) {
                            Text($0).tag($0.components(separatedBy: " ")[0])
                        }
                    }.frame(maxWidth: .infinity, alignment: .trailing)
                        .pickerStyle(.menu)
                }
             
                if(selectedLanguage == "Deutsch")
                {
                    ImpressumGerman()
                }
                
                if(selectedLanguage == "English")
                {
                    ImpressumEnglish()
                }
          
                }.frame(maxHeight: .infinity, alignment: .topLeading)
            
    
            if(selectedLanguage == "Deutsch"){
                Button("Schließe"){
                   dismiss()
                }
            }
            
            if(selectedLanguage == "English"){
                Button("Close"){
                  dismiss()
                }
            }
          
          
            
        }.frame(maxWidth: .infinity, alignment: .center)
     
    
    }
}

struct ImpressumView_Previews: PreviewProvider {
    static var previews: some View {
        ImpressumView()
    }
}
