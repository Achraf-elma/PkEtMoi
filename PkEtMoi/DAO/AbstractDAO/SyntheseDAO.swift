//
//  SyntheseDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 24/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol SyntheseDAO{
    func _insert(archive:Bool,debut:Int16, fin: Int16,rdv:RdvModel)
    func _getAll()->SyntheseSet
    func _getDebutPlageHoraire()->Int16
    func _setDebutPlageHoraire(debut:Int16)
    func _getFinPlageHoraire()->Int16
    func _setFinPlageHoraire(debut:Int16)
    func _getRdv()->RdvModel
    func _setRdv(rdv:RdvModel)
    func _getEtats()->EtatSet
    func _getEtats(date:Date)->EtatSet
    func _addEtat(date:Date,event:String,result:String)
    func _getCurrentSynthese()->SyntheseModel?
    func _getArchive()->Bool
    func _setArchive(archive:Bool)
    
}
