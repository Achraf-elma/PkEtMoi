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
    
    init(medicament : Medicament){
        self.instanceCoreData = medicament
    }
    
    init(){
        
    }
    
    func _getAll() -> MedicamentSet? {
        var medicament  = [Medicament]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Medicament")
        do{
            try medicament = CoreDataDAO.context.fetch(fetchRequest) as! [Medicament]
        }
        catch let error as NSError{
            print(error)
            return nil
        }
        let result = MedicamentSet()
        for med in medicament {
            result.insert(medicament: MedicamentModel(medicament: CoreDataMedicamentDAO(medicament:med)))
        }
        return result
    }
    
    func _insertMedicament(nom:String,description:String,dosage:[Int])->Bool    {
        let newMedicament = NSEntityDescription.insertNewObject(forEntityName: "Medicament", into: CoreDataDAO.context) as! Medicament
        newMedicament.nom = nom
        newMedicament.presentation = description
        for dose in dosage {
            let newDose = NSEntityDescription.insertNewObject(forEntityName: "Dosage", into: CoreDataDAO.context) as! Dosage
            newDose.dose = Int16(dose)
            newDose.contenir = newMedicament
        }
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
    
    func _deleteMedicament()->Bool    {
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
    
    func _getName()->String?    {
        return instanceCoreData?.nom;
    }
    
    func _setName(forname: String) {
        
    }
    
    func _getDescription() -> String? {
        return instanceCoreData?.presentation
    }
    
    func _setDescription(forname: String) {
        
    }
    
    func _getDoses() -> [Int] {
        var doses = instanceCoreData?.contenir?.allObjects as? [Dosage]
        var result = [Int]()
        for dose in doses! {
            result.append(Int(dose.dose))
        }
        return result
    }
    
    func _setDoses(forname: [Int]) {
        
    }
    
    func _getAlarmes() -> AlarmeSet? {
        let result : AlarmeSet = AlarmeSet()
        var alarme = instanceCoreData?.correspondre?.allObjects as! [AlarmeMedicament]
        alarme = alarme.sorted(by: { $0.date?.compare($1.date! as Date) == .orderedAscending})
        for a in alarme {
            let interval = a.date?.timeIntervalSince(Date())
            if(interval?.isLessThanOrEqualTo(0))!{
                do{
                    CoreDataDAO.context.delete(a)
                    try CoreDataDAO.context.save()
                }
                catch let error as NSError{
                    print(error)
                }
            }
            else{
                result.insert(alarme: AlarmeModel(alarme: CoreDataAlarmeDAO(alarme:a)))
            }
        }
        return result
    }
    
    func _addAlarme(date: Date) {
        let newAlarme = NSEntityDescription.insertNewObject(forEntityName: "AlarmeMedicament", into: CoreDataDAO.context) as! AlarmeMedicament
        newAlarme.date = date
        newAlarme.correspondre = instanceCoreData
        do{
            try CoreDataDAO.context.save()
        }
        catch let error as NSError{
            print(error)
        }
    }
    
    func _deleteAlarme(date: Date) {
        let alarmesMeds = instanceCoreData?.correspondre?.allObjects as! [AlarmeMedicament]
        for alarme in alarmesMeds {
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
