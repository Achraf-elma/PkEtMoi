//
//  CoreDataAlarmDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 22/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
import CoreData
class CoreDataAlarmeDAO : AlarmeDAO{

    var instanceCoreData: Alarme? = nil
    
    init(alarme : Alarme){
        self.instanceCoreData = alarme
    }
    
    init(){
        
    }
    
    func _getAllAlarmes() -> AlarmeSet? {
        var alarme  = [Alarme]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Alarme")
        do{
            try alarme = CoreDataDAO.context.fetch(fetchRequest) as! [Alarme]
        }
        catch let error as NSError{
            print(error)
            return nil
        }
        let sortedAlarme = alarme.sorted(by: { $0.date?.compare($1.date! as Date) == .orderedDescending})
        let result = AlarmeSet()
        for a in sortedAlarme {
            result.insert(alarme: AlarmeModel(alarme: CoreDataAlarmeDAO(alarme:a)))
        }
        return result
    }
    
    func _deleteAlarm() -> Bool {
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
    
    func _getDate() -> Date? {
        return instanceCoreData?.date! as Date?
    }
    
    func _isMedicamentAlarm() -> Bool {
        return instanceCoreData is AlarmeMedicament
    }
    
    func _isRdvAlarme() -> Bool {
        return instanceCoreData is AlarmeRDV
    }
    
    func _isActiviteAlarme() -> Bool {
        return instanceCoreData is AlarmeActivite
    }
    
    func _getAlarmes(date: Date) -> AlarmeSet? {
        var alarme  = [Alarme]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Alarme")
        do{
            try alarme = CoreDataDAO.context.fetch(fetchRequest) as! [Alarme]
        }
        catch let error as NSError{
            print(error)
            return nil
        }
        alarme = alarme.sorted(by: { $0.date?.compare($1.date! as Date) == .orderedAscending})
        let result = AlarmeSet()
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
                if(Calendar.current.isDate(a.date! as Date, inSameDayAs:date)){
                    result.insert(alarme: AlarmeModel(alarme: CoreDataAlarmeDAO(alarme:a)))
                }
            }
        }
        return result
    }
    
}
