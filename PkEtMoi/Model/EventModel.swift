//
//  Notification.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol EventModel{
    
    func getLabel()->String?
    @discardableResult  func delete()->Bool
    
}
