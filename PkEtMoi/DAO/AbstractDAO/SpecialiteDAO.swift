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
    
    //Renvoie le nom de la spécialité.
    func _getNom()->String
    
    //Attribue un nom à la spécialité.
    func _setNom(nom:String)
    
    //Retourne toutes les spécialités.
    func _getAll()->SpecialiteSet

    
}
