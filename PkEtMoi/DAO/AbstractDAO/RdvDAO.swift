//
//  RdvDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 21/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol RdvDAO{
    
    func _getAll() -> RdvSet?
    func _insert(adresse:String,date:Date,nom:String,prenom:String,telephone:Int32)->Bool
    func _delete()->Bool
    func _update(rdv : RdvModel)->RdvModel?
    
    func _getFirstName()->String?
    func _setFirstName(forname:String)
    
    func _getLastName()->String?
    func _setLastName(forname:String)
    
    func _getPhone()->Int32?
    func _setPhone(forname:Int32)
    
    func _getAdresse()->String?
    func _setAdresse(forname:String)
    
    func _getDate()->Date?
    func _setDate(forname:Date)
    
    func _getAlarmes()->[AlarmeRDV]?
    func _addAlarme(date:Date)
    func _deleteAlarme(date:Date)
    
    func _getSynthese()->Synthese?
    func _setSynthese(debut:Int16,fin:Int16,etat:[Etat])
    
    func _getMedecin()->Medecin?
    func _setMedecin(nom:String,prenom:String,adresse:String,telephone:Int32,specialite:Specialite)
 
}
