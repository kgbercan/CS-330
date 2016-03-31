//
//  Rower.swift
//  PaceGuide
//
//  Created by Karina Bercan on 3/31/16.
//  Copyright © 2016 Karina Bercan. All rights reserved.
//

import Foundation

class Rower{
    
    // name and most recent 500
    let name: String
    let fivehund: String
    
    // constructor
    init(name: String, fivehund: String){
        self.name = name
        self.fivehund = fivehund
    }
    
    // returns name
    func getName() -> String{
        return(name)
    }
    
    // returns 500 time
    func getTime() -> String{
        return(fivehund)
    }
    
}