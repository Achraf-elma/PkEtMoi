//
//  RdvModel.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class RdvModel: Notification{
    
    var label :String
    var date :Date
    
    init(label:String, date:Date){
        self.label = label
        self.date = date
    }
    
    func getLabel() -> String {
        return label
    }
    
    func getDate() -> Date {
        return date
    }
    
    func setLabel(label: String) {
        self.label = label
    }
    
    func setDate(date: Date) {
        self.date = date
    }
}
