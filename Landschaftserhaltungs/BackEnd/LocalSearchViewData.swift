//
//  LocalSearchViewData.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 19.10.22.
//

import Foundation
import MapKit
struct LocalSearchViewData: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    
    init(mapItem: MKMapItem) {
        self.title = mapItem.name ?? ""
        self.subtitle = mapItem.placemark.title ?? ""
    }
}
