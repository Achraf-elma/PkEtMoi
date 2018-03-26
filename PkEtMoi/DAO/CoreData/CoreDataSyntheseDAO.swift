//
//  CoreDataSyntheseDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 24/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation 
import CoreData
class CoreDataSyntheseDAO:SyntheseDAO{

    var instanceCoreData: Synthese? = nil
    
    init(synthese : Synthese){
        self.instanceCoreData = synthese
    }
    
    init(){
        
    }
    
    func _insert(archive: Bool, debut: Int16, fin: Int16, rdv: RdvModel) {
        let newSynthese = NSEntityDescription.insertNewObject(forEntityName: "Synthese", into: CoreDataDAO.context) as! Synthese
        newSynthese.archive = archive
        newSynthese.debutPlageHoraire = debut
        newSynthese.finPlageHoraire = fin
        rdv.synthese = newSynthese
        do{
            try CoreDataDAO.context.save()
            self.instanceCoreData = newSynthese
        }
        catch let error as NSError{
            print(error)
        }
    }
    
    func _addEtat(date: Date, event: String, result: String) {
        let newEtat = NSEntityDescription.insertNewObject(forEntityName: "Etat", into: CoreDataDAO.context) as! Etat
        newEtat.date = date
        newEtat.evenementParticulier = event
        newEtat.reponseEtat = result
        newEtat.renseigner = instanceCoreData
        do{
            try CoreDataDAO.context.save()
            print("success")
        }
        catch let error as NSError{
            print(error)
        }
    }
    
    func _getDebutPlageHoraire() -> Int16 {
        return (instanceCoreData?.debutPlageHoraire)!
    }
    
    func _setDebutPlageHoraire(debut: Int16) {
        
    }
    
    func _getRdv() -> RdvModel {
        return RdvModel(rdv: CoreDataRdvDAO(rdv:(instanceCoreData?.correspond)!)) 
    }
    
    func _getFinPlageHoraire() -> Int16 {
        return (instanceCoreData?.finPlageHoraire)!
    }
    
    func _setFinPlageHoraire(debut: Int16) {
        
    }
    
    func _setRdv(rdv: RdvModel) {
        
    }
    
    func _getEtats() -> EtatSet {
        let result : EtatSet = EtatSet()
        let etat = instanceCoreData?.renseigner?.allObjects as! [Etat]
        for a in etat {
            result.insert(etat: EtatModel(etat: CoreDataEtatDAO(etat:a)))
        }
        return result
    }
    
    func _getEtats(date:Date) -> EtatSet {
        let result : EtatSet = EtatSet()
        var etat = instanceCoreData?.renseigner?.allObjects as! [Etat]
        etat = etat.sorted(by: { $0.date?.compare($1.date! as Date) == .orderedAscending})
        for a in etat {
            if(Calendar.current.isDate(a.date! as Date, inSameDayAs:date)){
                result.insert(etat: EtatModel(etat: CoreDataEtatDAO(etat:a)))
            }
        }
        return result
    }
    
    func _getCurrentSynthese() -> SyntheseModel? {
        var synthese  = [Synthese]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Synthese")
        do{
            try synthese = CoreDataDAO.context.fetch(fetchRequest) as! [Synthese]
        }
        catch let error as NSError{
            print(error)
            return nil
        }
        var result : SyntheseModel? = nil
        for r in synthese {
            if !r.archive {
                result = SyntheseModel(synthese: CoreDataSyntheseDAO(synthese:r))
            }
        }
        return result
    }
    
    func _getArchive() -> Bool {
        return (instanceCoreData?.archive)!
    }
    
    func _setArchive(archive: Bool) {
        instanceCoreData?.archive = archive
    }
    
    func _getAll() -> SyntheseSet {
        var synthese  = [Synthese]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Synthese")
        do{
            try synthese = CoreDataDAO.context.fetch(fetchRequest) as! [Synthese]
        }
        catch let error as NSError{
            print(error)
            return SyntheseSet()
        }
        let result = SyntheseSet()
        for a in synthese {
            result.insert(synthese: SyntheseModel(synthese: CoreDataSyntheseDAO(synthese:a)))
        }
        return result
    }
    
    
}
