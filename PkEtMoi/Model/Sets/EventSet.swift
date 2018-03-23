//
//  MedicamentSet.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 20/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class EventSet{
    
    var event: [EventModel] = []
    
    var count :Int{
        get{
            return event.count
        }
    }
    
    init(){
        
    }
    
    init(activiteSet:ActiviteSet){
        var i = 0
        while i < activiteSet.count{
            event.append(activiteSet.get(i: i)!)
            i = i + 1
        }
    }
    
    init(rdvSet:RdvSet){
        var i = 0
        while i < rdvSet.count{
            event.append(rdvSet.get(i: i)!)
            i = i + 1
        }
    }
    
    
    init(medicamentSet:MedicamentSet?){
        var i = 0
        while i < (medicamentSet?.count)!{
            event.append((medicamentSet?.get(i: i)!)!)
            i = i + 1
        }
    }
    
    init(event:[EventModel]){
        self.event = event
    }
    
    @discardableResult func insert(event : EventModel)->Bool{
        self.event.append(event)
        return true
    }
    
    @discardableResult func delete(eventToDelete : EventModel)->Bool{
        if let i = self.event.index(where: {(act) -> Bool in act.getLabel() == eventToDelete.getLabel()}) {
            if eventToDelete is MedicamentModel{
                let current = eventToDelete as! MedicamentModel
                current.delete()
            }
            else if eventToDelete is RdvModel{
                let current = eventToDelete as! RdvModel
                current.delete()
            }
            else if eventToDelete is ActiviteModel{
                let current = eventToDelete as! ActiviteModel
                current.delete()
            }
            self.event.remove(at: i)
            return true
        }
        return false
    }
    
    func get(i:Int)->EventModel?{
        if(i < 0 || i >= event.count){
            return nil
        }
        return self.event[i]
    }
    
    func searchByName(name : String)->EventModel?{
        if let i = self.event.index(where: { (act) -> Bool in act.getLabel() == name}) {
            return self.event[i]
        }
        return nil
    }
    
}


