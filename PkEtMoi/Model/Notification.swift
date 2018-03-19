//
//  Notification.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol Notification{
    
    func getLabel() -> String
    func getDate() -> Date
    func setLabel(label:String)
    func setDate(date:Date)
    
}
