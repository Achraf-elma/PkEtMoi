//
//  File.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation

class DateHandler{
    
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
    
    init(date:Date,formatter:String){
        self.date = date
        self.dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = formatter
    }
    
    func nextDay() -> String{
        date.addTimeInterval(86400)
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return currentDate
    }
    
    func previousDay() -> String{
        date.addTimeInterval(-86400)
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return currentDate
    }
    
    func toStringDay() -> String{
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return currentDate
    }
    
    func toStringHour() -> String{
        dateFormatter.dateFormat = "HH:mm"
        return currentDate
    }
    
    static func toString(date:Date)->String{
        var formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy HH:mm"
        return formatter.string(from: date)
    }
    
}
