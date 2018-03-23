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
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Activite")
        do{
            try activite = CoreDataDAO.context.fetch(fetchRequest) as! [Activite]
        }
        catch let error as NSError{
            print(error)
            return nil
        }
        let result = ActiviteSet()
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
    
    func _getExperience() -> Int16 {
        return (instanceCoreData?.experience)!
    }
    
    func _setExperience(experience: Int16) {
        do{
            instanceCoreData?.experience = experience
            try CoreDataDAO.context.save()
        }
        catch let error as NSError{
            print(error)
        }
    }
    
    func _getNiveau() -> Int16 {
        return (instanceCoreData?.niveau)!
    }
    
    func _setNiveau(niveau: Int16) {
        do{
            instanceCoreData?.niveau = niveau
            try CoreDataDAO.context.save()
        }
        catch let error as NSError{
            print(error)
        }
    }
    
    func _getAlarmes() -> AlarmeSet? {
        let result : AlarmeSet = AlarmeSet()
        var alarme = instanceCoreData?.concerner?.allObjects as! [AlarmeActivite]
        alarme = alarme.sorted(by: { $0.date?.compare($1.date! as Date) == .orderedAscending})
        for a in alarme {
            result.insert(alarme: AlarmeModel(alarme: CoreDataAlarmeDAO(alarme:a)))
        }
        return result
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
        let alarmesAct = instanceCoreData?.concerner?.allObjects as! [AlarmeActivite]
        for alarme in alarmesAct {
            if alarme.date?.compare(date) == .orderedSame{
                do{
                    CoreDataDAO.context.delete(alarme)
                    try CoreDataDAO.context.save()
                }
                catch let error as NSError{
                    print(error)
                }
            }
        }
    }
    
}

