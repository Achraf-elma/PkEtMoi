//
//  SpecialiteDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 25/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol SpecialiteDAO{
    func _insertSpecialite(nom:String)
    func _getNom()->String
    func _setNom(nom:String)
    func _getAll()->SpecialiteSet
    
}
