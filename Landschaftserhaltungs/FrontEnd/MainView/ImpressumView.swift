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
                .padding(.leading)
            Text("Landkreis Tuttlingen e.V.").font(Font.headline.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
            
            Text("Bahnhofstr. 100").frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
            Text("78532 Tuttlingen").frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
            
            Text("Kontakt").font(Font.headline.weight(.bold)).padding(.top).padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("E-Mail:  info@lev-tut.de").frame(maxWidth: .infinity, alignment: .leading).padding(.top).padding(.leading)
            Text("Web: www.lev-tut.de").frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
            
            Text("Eintragung im Vereinsregister").font(Font.headline.weight(.bold)).padding(.top).padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Registergericht: Amtsgericht Tuttlingen").frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
            Text("Vr-Nummer: 920").frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
        }
    }
}

struct ImpressumView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {



        VStack{
            Text("Impressum")  .font(Font.headline.weight(.bold)).padding()
            VStack{
                    ImpressumGerman()
                }.frame(maxHeight: .infinity, alignment: .topLeading)
            
    
     
                Button("Schließe"){
                   dismiss()
                }.frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
            

        }.frame(maxWidth: .infinity, alignment: .center)
     
    
    }
}

struct ImpressumView_Previews: PreviewProvider {
    static var previews: some View {
        ImpressumView()
    }
}
