//
//  PlantSpecies.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 07.11.22.
//

import Foundation


class PlantSpecies : Identifiable
{
    

  
    public var scientificName : String = " "
    public var redListBw : String = " "
    public var responsibility : String = " "
    public var oberReihnArea : String = " "
    public var blackForest : String = " "
    public var odenWald : String = " "
    public var nothernGaelandschaften : String = " "
    public var southernGaelandschaften : String = " "
    public var schaebischeAlb : String = " "
    public var alpenvorland : String = " "
    public var germanName : String = " "
    public var evaluation1a : String = " "
    public var evaluation1b : String = " "
    public var evaluation1c : String = " "
    public var evaluation1d : String = " "
    public var evaluation2 : String = " "
    public var evaluation3 : String = " "
    @Published public var isChecked : Bool = false
  
    
    static func == (lhs: PlantSpecies, rhs: PlantSpecies) -> Bool {
        return (lhs.scientificName) == (rhs.scientificName)
    }
    
    
    static func < (lhs: PlantSpecies , rhs: PlantSpecies) -> Bool {
        return (lhs.scientificName) < (rhs.scientificName)
        }
    
    
    init(row : [String])
    {
        
        self.scientificName = row[0]
        self.germanName = row[1]
        self.evaluation1a = row[2]
        self.evaluation1b = row[3]
        self.evaluation1c = row[4]
        self.evaluation1d = row[5]
        self.evaluation2 = row[6]
        self.evaluation3 = row[7]
        self.redListBw = row[8]
    }
    
    
    public func getScientificName() -> String
    {
        return self.scientificName
    }
    
    public func getGermanName() -> String
    {
        return self.germanName
    }
    
    public func getEvaluation1a() -> String
    {
        return self.evaluation1a
    }
    public func getEvaluation1b() -> String
    {
        return self.evaluation1b
    }
    public func getEvaluation1c() -> String
    {
        return self.evaluation1c
    }
    public func getEvaluation1d() -> String
    {
        return self.evaluation1d
    }
    public func getEvaluation2() -> String
    {
        return self.evaluation2
    }
    public func getEvaluation3() -> String
    {
        return self.evaluation3
    }
    public func getRL() -> String
    {
        return redListBw
    }
    
    
}





