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

class CoreDataActiviteDAO : ActiviteDAO{


    var instanceCoreData: Activite? = nil
    
    init(activite : Activite){
        self.instanceCoreData = activite
    }
    
    init(){
        
    }
    
    func _getAll() -> ActiviteSet? {
        var activite  = [Activite]()
        
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Activite")
        do{
            try activite = CoreDataDAO.context.fetch(fetchRequest) as! [Activite]
        }
        catch let error as NSError{
            print(error)
            return nil
        }
        var result = ActiviteSet()
        for act in activite {
            result.insert(activite: ActiviteModel(activite: CoreDataActiviteDAO(activite:act)))
        }
        return result
    }
    
    func _insert(nom: String, niveau: Int16, experience: Int16)->Bool
    {
        let newActivite = NSEntityDescription.insertNewObject(forEntityName: "Activite", into: CoreDataDAO.context) as! Activite
        newActivite.nom = nom
        newActivite.niveau = niveau
        newActivite.experience = experience
        do{
            try CoreDataDAO.context.save()
            self.instanceCoreData = newActivite
            return true
        }
        catch let error as NSError{
            print(error)
            return false
        }
    }
    
    internal func _delete()->Bool
    {
        do{
            CoreDataDAO.context.delete(self.instanceCoreData!)
            try CoreDataDAO.context.save()
            return true
        }
        catch let error as NSError{
            print(error)
            return false
        }
    }
    
    func _update(activite: ActiviteModel) -> ActiviteModel? {
        return nil
    }
    
    func _getName() -> String? {
        return instanceCoreData?.nom
    }
    
    func _setName(forname: String) {
        
    }
    
    func _getExperience() -> Int16? {
        return instanceCoreData?.experience
    }
    
    func _setExperience(experience: Int16) {
        
    }
    
    func _getNiveau() -> Int16? {
        return instanceCoreData?.niveau
    }
    
    func _setNiveau(niveau: Int16) {
        
    }
    
    func _getAlarmes() -> [AlarmeActivite]? {
        return instanceCoreData?.concerner?.allObjects as! [AlarmeActivite]
    }
    
    func _addAlarme(date: Date) {
        let newAlarme = NSEntityDescription.insertNewObject(forEntityName: "AlarmeActivite", into: CoreDataDAO.context) as! AlarmeActivite
        newAlarme.date = date as NSDate
        newAlarme.concerner = instanceCoreData
        do{
            try CoreDataDAO.context.save()
        }
        catch let error as NSError{
            print(error)
        }
    }
    
    func _deleteAlarme(date: Date) {
        
    }
    
}
