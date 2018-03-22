//
//  ResumeDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol ActiviteDAO{
    
    func _getAll() -> ActiviteSet?
    func _insert(nom:String,niveau:Int16,experience:Int16)->Bool
    func _delete()->Bool
    func _update(activite : ActiviteModel)->ActiviteModel?
    
    
    func _getName()->String?
    func _setName(forname:String)
    
    func _getExperience()->Int16?
    func _setExperience(experience:Int16)
    
    func _getNiveau()->Int16?
    func _setNiveau(niveau:Int16)
    
    func _getAlarmes()->[AlarmeActivite]?
    func _addAlarme(date:Date)
    func _deleteAlarme(date:Date)
}
