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
    
    override init(){
        
    }
    
    override func _getAll() -> ActiviteSet? {
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
    
    override func _insert(nom:String,description:String)->Bool
    {
        let newActivite = NSEntityDescription.insertNewObject(forEntityName: "Activite", into: CoreDataDAO.context) as! Activite
        newActivite.nom = nom
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
    
    override internal func _delete()->Bool
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
    
    override func _getName()->String?
    {
        return instanceCoreData?.nom;
    }
    
    override func _setName(forname:String)
    {
        fatalError(#function + "Must be overridden");
    }
    
    override  func _getDescription()->String?
    {
        fatalError(#function + "Must be overridden");
        return nil;
    }
    
    override func _setDescription(forname:String)
    {
        fatalError(#function + "Must be overridden");
    }
    
}

