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
    private var reating1a : Bool
    private var reating1b : Bool
    private var reating1c : Bool
    private var reating1d : Bool
    private var reating2 : Bool
    private var reating3 : Bool

    
    
    init(scientificName: String, germanName: String, redList: String, reating1a: Bool, reating1b: Bool, reating1c: Bool, reating1d: Bool, reating2: Bool, reating3: Bool) {
        self.scientificName = scientificName
        self.germanName = germanName
        self.redList = redList
        self.reating1a = reating1a
        self.reating1b = reating1b
        self.reating1c = reating1c
        self.reating1d = reating1d
        self.reating2 = reating2
        self.reating3 = reating3
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
        return changeBoolInChar(checked: reating1a)
    }
    
    
    public func getReating1b() -> String
    {
        return changeBoolInChar(checked: reating1b)
    }
    
    public func getReating1c() -> String
    {
        return changeBoolInChar(checked: reating1c)
    }
    
    public func getReating1d() -> String
    {
        return changeBoolInChar(checked: reating1d)
    }
    
    public func getReating2() -> String
    {
        return changeBoolInChar(checked: reating2)
    }
    
    public func getReating3() -> String
    {
        return changeBoolInChar(checked: reating3)
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
