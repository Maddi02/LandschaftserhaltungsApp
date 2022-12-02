//
//  PlantMatcher.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 27.11.22.
//

import Foundation


class PlantMatcher
{
    private var scientificName : String
    private var germanName : String
    private var redList : String
    private var reating1a : String
    private var reating1b : String
    private var reating1c : String
    private var reating1d : String
    private var reating2 : String
    private var reating3 : String
    private var frequency : String

    
    
    init(scientificName: String, germanName: String, redList: String, reating1a: String, reating1b: String, reating1c: String, reating1d: String, reating2: String, reating3: String, frequency : String) {
        self.scientificName = scientificName
        self.germanName = germanName
        self.redList = redList
        self.reating1a = reating1a
        self.reating1b = reating1b
        self.reating1c = reating1c
        self.reating1d = reating1d
        self.reating2 = reating2
        self.reating3 = reating3
        self.frequency = frequency
    }
    
    
    public func getScientificName() -> String
    {
        return scientificName
    }
    
    public func getGermanName() -> String
    {
        return germanName
    }
    
    public func getRedList() -> String
    {
        return redList
    }
    
    
    public func getReating1a() -> String
    {
        return reating1a
    }
    
    
    public func getReating1b() -> String
    {
        return reating1b
    }
    
    public func getReating1c() -> String
    {
        return reating1c
    }
    
    public func getReating1d() -> String
    {
        return reating1d
    }
    
    public func getReating2() -> String
    {
        return reating2
    }
    
    public func getReating3() -> String
    {
        return reating3
    }
    
    public func getFrequency() -> String
    {
        return self.frequency
    }
    
    
    private func changeBoolInChar(checked : Bool) -> String
    {
        if(checked)
        {
            return "X"
        }
        else
        {
            return " "
        }
        
    }
    
    
    
    
    
    
}
