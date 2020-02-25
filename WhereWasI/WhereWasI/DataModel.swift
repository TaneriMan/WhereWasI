//
//  DataModel.swift
//  WhereWasI
//
//  Created by TANER DÜZCEER on 24.02.2020.
//  Copyright © 2020 TanerMan. All rights reserved.
//

import Foundation

//This class is for visited locations
class VisitedPoint
{
    var latitude : String
    var longitute : String
    
    //It is for getting rid of initializing error
    init( lat : String, long : String )
    {
        self.latitude = lat
        self.longitute = long
    }
}
