//
//  File.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation

class dateBrowserDelegate{
    
    var date : Date
    var currentDate : String{
        return dateFormatter.string(from: date)
    }
    let dateFormatter : DateFormatter
    
    init(){
        self.date = Date()
        self.dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
    }
    
    func nextDay() -> String{
        date.addTimeInterval(86400)
        return currentDate
    }
    
    func previousDay() -> String{
        date.addTimeInterval(86400)
        return currentDate
    }
    
}
