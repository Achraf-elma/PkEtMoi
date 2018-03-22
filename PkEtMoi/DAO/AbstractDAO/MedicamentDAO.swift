//
//  ResumeDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol MedicamentDAO {

    func _getAll()-> MedicamentSet?
    func _getAllAlarms()->AlarmeMedicamentSet?
    
    func _insertMedicament(nom:String,description:String)->Bool
    func _deleteMedicament()->Bool
    
    func _getName()->String?
    func _setName(forname:String)

    func _getDescription()->String?
    func _setDescription(forname:String)

    
    func _getDoses()->[DosesModel]?
    func _setDoses(forname:[DosesModel])
    
    func _getAlarmes()->[AlarmeMedicament]?
    func _addAlarme(date:Date)
    func _deleteAlarme(date:Date)
    
}