//
//  DataStore.swift
//  WhereWasI
//
//  Created by TANER DÜZCEER on 24.02.2020.
//  Copyright © 2020 TanerMan. All rights reserved.
//

import Foundation
//This class is needed for storing locations
struct StorageKeys
{
    //static means this variable belons to this struct
    static let storedLatitute = "Stored Latitute" //this string ("Stored Latitute") is key of all latitutes
    static let storedLongitute = "Stored Longitute"
    
}
class DataStore
{
    //To get user default values
    func GetDefaults() -> UserDefaults
    {
        return UserDefaults.standard
    }
    //To store Data points
    func StoreDataPoint( latitute : String, longitute : String)
    {
        let def = GetDefaults()
        //set longitute and latitutes
        def.set(latitute, forKey: StorageKeys.storedLatitute)
        def.set(longitute, forKey: StorageKeys.storedLongitute)
        //for saving we have to syncronize def
        def.synchronize()
        
        print(latitute + " : " + longitute)
    }
    //Last location of the phone
    func GetLastLocation() -> VisitedPoint
    {
        let defaults = GetDefaults()
        if let lat = defaults.string(forKey: StorageKeys.storedLatitute)
        {
            if let long = defaults.string(forKey: StorageKeys.storedLongitute)
            {
                return VisitedPoint.init(lat: lat, long: long)
            }
        }
        return VisitedPoint.init(lat: "", long: "")
    }
    
}
