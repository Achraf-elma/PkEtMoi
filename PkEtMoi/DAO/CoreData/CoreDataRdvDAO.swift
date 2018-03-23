//
//  CoreDataRdvDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 21/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
import CoreData
class CoreDataRdvDAO:RdvDAO{

    var instanceCoreData: RDV? = nil
    
    init(rdv : RDV){
        self.instanceCoreData = rdv
    }
    
    init(){
        
    }
    
    func _getAll() -> RdvSet? {
        var rdv  = [RDV]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RDV")
        do{
            try rdv = CoreDataDAO.context.fetch(fetchRequest) as! [RDV]
        }
        catch let error as NSError{
            print(error)
            return nil
        }
        let result = RdvSet()
        for r in rdv {
            result.insert(rdv: RdvModel(rdv: CoreDataRdvDAO(rdv:r)))
        }
        return result
    }
    
    func _insert(adresse: String, date: Date, nom: String, prenom: String, telephone: String) -> Bool {
        let newRdv = NSEntityDescription.insertNewObject(forEntityName: "RDV", into: CoreDataDAO.context) as! RDV
        newRdv.adresse = adresse
        newRdv.date = date
        newRdv.nom = nom
        newRdv.prenom = prenom
        newRdv.telephone = telephone
        do{
            try CoreDataDAO.context.save()
            self.instanceCoreData = newRdv
            return true
        }
        catch let error as NSError{
            print(error)
            return false
        }
    }
    
    func _delete() -> Bool {
        CoreDataDAO.context.delete(self.instanceCoreData!)
        do{
            try CoreDataDAO.context.save()
        }
        catch let error as NSError{
            print(error)
            return false
        }
        return true
    }
    
    func _update(rdv: RdvModel) -> RdvModel? {
        return nil
    }
    
    func _getFirstName() -> String? {
        return instanceCoreData?.prenom
    }
    
    func _setFirstName(forname: String) {
        
    }
    
    func _getLastName() -> String? {
        return instanceCoreData?.nom
    }
    
    func _setLastName(forname: String) {
        
    }
    
    func _getAdresse() -> String? {
        return instanceCoreData?.adresse
    }
    
    func _setAdresse(forname: String) {
        
    }
    
    func _getDate() -> Date? {
        return instanceCoreData?.date as Date?
    }
    
    func _setDate(forname: Date) {
        
    }
    
    func _getPhone() -> String? {
        return instanceCoreData?.telephone
    }
    
    func _setPhone(forname: String) {
        
    }
    
    func _getAlarmes() -> AlarmeSet? {
        let result : AlarmeSet = AlarmeSet()
        var alarme = instanceCoreData?.associer?.allObjects as! [AlarmeRDV]
        alarme = alarme.sorted(by: { $0.date?.compare($1.date! as Date) == .orderedAscending})
        for a in alarme {
            result.insert(alarme: AlarmeModel(alarme: CoreDataAlarmeDAO(alarme:a)))
        }
        return result
    }
    
    func _addAlarme(date: Date) {
        let newAlarme = NSEntityDescription.insertNewObject(forEntityName: "AlarmeRDV", into: CoreDataDAO.context) as! AlarmeRDV
        newAlarme.date = date
        newAlarme.associer = instanceCoreData
        do{
            try CoreDataDAO.context.save()
            print("success")
        }
        catch let error as NSError{
            print(error)
        }
    }
    
    func _deleteAlarme(date: Date) {
        let alarmesRdv = instanceCoreData?.associer?.allObjects as! [AlarmeRDV]
        for alarme in alarmesRdv {
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
    
    func _getSynthese() -> Synthese? {
        return instanceCoreData?.peutAvoir
    }
    
    func _setSynthese(debut:Int16,fin:Int16,etat:[Etat]) {
        
    }
    
    func _getMedecin() -> Medecin? {
        return instanceCoreData?.planifier
    }
    
    func _setMedecin(nom:String,prenom:String,adresse:String,telephone:Int32,specialite:Specialite) {
        
    }
}
