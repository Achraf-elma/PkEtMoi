//
//  CoreDataSpecialiteDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 25/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
import CoreData
class CoreDataSpecialiteDAO : SpecialiteDAO{

    var instanceCoreData: Specialite? = nil
    
    init(specialite : Specialite){
        self.instanceCoreData = specialite
    }
    
    init(){
        
    }
    
    func _insertSpecialite(nom:String){
        let newSpecialite = NSEntityDescription.insertNewObject(forEntityName: "Specialite", into: CoreDataDAO.context) as! Specialite
        newSpecialite.nom = nom
        do{
            try CoreDataDAO.context.save()
            self.instanceCoreData = newSpecialite
        }
        catch let error as NSError{
            print(error)
        }
    }
    
    func _getNom() -> String {
        return instanceCoreData!.nom!
    }
    
    func _setNom(nom: String) {
        instanceCoreData?.nom = nom
    }
    
    func _getAll() -> SpecialiteSet {
        var specialite  = [Specialite]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Specialite")
        do{
            try specialite = CoreDataDAO.context.fetch(fetchRequest) as! [Specialite]
        }
        catch let error as NSError{
            print(error)
            return SpecialiteSet()
        }
        let result = SpecialiteSet()
        for a in specialite {
            result.insert(specialite: SpecialiteModel(specialite: CoreDataSpecialiteDAO(specialite:a)))
        }
        return result
    }
}
