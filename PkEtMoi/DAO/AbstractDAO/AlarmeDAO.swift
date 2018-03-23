//
//  AlarmeDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 22/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol AlarmeDAO{
    
    func _getAllAlarmes()->AlarmeSet?
    func _getAlarmes(date:Date)->AlarmeSet?
    @discardableResult func _deleteAlarm()->Bool
    func _getDate()->Date?
    func _isMedicamentAlarm()->Bool
    func _isRdvAlarme()->Bool
    func _isActiviteAlarme()->Bool
}

