//
//  InformationAnderesBiotop.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 09.11.22.
//

import SwiftUI

struct InformationAnderesBiotop: View {
    @State private var dataOfTaking = Date()
    @State private var farming : String = ""
    @State private var position : String = ""
    @State private var vegetationDescription : String = ""
    @State private var bloomAspect : String = ""
    @State private var ratingImpairment  : String = ""
    @State private var overallAssessmentOfTheStateOfPreservation  : String = ""
    @State private var faunisticObservation  : String = ""
    @State private var contractTarget  : String = ""
    @State private var adaptationEditions  : String = ""
    @State private var furtherMaintenanceMeasures  : String = ""
    
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                Text("Hello, World! Anderes Biotop").navigationBarBackButtonHidden(true)
            }.navigationTitle("Information")
        }.navigationBarBackButtonHidden(true)

        
    }
}

struct InformationAnderesBiotop_Previews: PreviewProvider {
    static var previews: some View {
        InformationAnderesBiotop()
    }
}
