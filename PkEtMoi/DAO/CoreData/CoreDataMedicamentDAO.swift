//
//  CoreDataResumeDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataMedicamentDAO : MedicamentDAO{
    
    var instanceCoreData: Medicament? = nil
    
    override init(){
        
    }
    
    override func _insertMedicament(nom:String,description:String)->Bool
    {
        let newMedicament = NSEntityDescription.insertNewObject(forEntityName: "Medicament", into: CoreDataDAO.context) as! Medicament
        newMedicament.nom = nom
        newMedicament.presentation = description
        do{
            try CoreDataDAO.context.save()
            self.instanceCoreData = newMedicament
            return true
        }
        catch let error as NSError{
            print(error)
            return false
        }
    }
    
    override internal func _getName()->String?
    {
        return instanceCoreData?.nom;
    }
    
    override internal func _setName(forname:String)
    {
        fatalError(#function + "Must be overridden");
    }
    
    override internal func _getDescription()->String?
    {
        fatalError(#function + "Must be overridden");
        return nil;
    }
    
    override internal func _setDescription(forname:String)
    {
        fatalError(#function + "Must be overridden");
    }
    
    override internal func _getDoses()->[DosesModel]?
    {
        fatalError(#function + "Must be overridden");
        return nil;
    }
    
    override internal func _setDoses(forname:[DosesModel])
    {
        fatalError(#function + "Must be overridden");
    }
    
}
