//
//  EtatDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 24/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol EtatDAO{
    
    func _getDate()->Date

    
    func _getEvenementParticulier()->String
    func _setEvenementParticulier(event:String)
    
    func _getReponseEtat()->String
    func _setReponseEtat(event:String)

}
