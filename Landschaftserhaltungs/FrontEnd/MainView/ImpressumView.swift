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
            Text("Landschaftserhaltungsverband").font(Font.headline.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Landkreis Tuttlingen e.V.").font(Font.headline.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Bahnhofstr. 100").frame(maxWidth: .infinity, alignment: .leading)
            Text("78532 Tuttlingen").frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Kontakt").font(Font.headline.weight(.bold)).padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("E-Mail:  info@lev-tut.de").frame(maxWidth: .infinity, alignment: .leading).padding(.top)
            Text("Web: www.lev-tut.de").frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Eintragung im Vereinsregister").font(Font.headline.weight(.bold)).padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Registergericht: Amtsgericht Tuttlingen").frame(maxWidth: .infinity, alignment: .leading)
            Text("Vr-Nummer: 920").frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct ImpressumView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {



        VStack{
            Text("Impressum")  .font(Font.headline.weight(.bold))
            VStack{
                    ImpressumGerman()
                }.frame(maxHeight: .infinity, alignment: .topLeading)
            
    
     
                Button("Schließe"){
                   dismiss()
                }
            

        }.frame(maxWidth: .infinity, alignment: .center)
     
    
    }
}

struct ImpressumView_Previews: PreviewProvider {
    static var previews: some View {
        ImpressumView()
    }
}
