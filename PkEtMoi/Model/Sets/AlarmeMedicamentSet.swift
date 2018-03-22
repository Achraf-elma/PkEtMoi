//
//  MedicamentSet.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 20/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class AlarmeMedicamentSet{
    
    var alarme : [AlarmeMedicament] = []
    
    var count :Int{
        get{
            return alarme.count
        }
    }
    
    init(){
        
    }
    
    init(activite:[AlarmeMedicament]){
        self.alarme = activite
    }
    
    func insert(alarme : AlarmeMedicament)->Bool{
        self.alarme.append(alarme)
        return true
    }
    
    func delete(alarme : AlarmeMedicament)->Bool{
        if let i = self.alarme.index(where: {$0.date == alarme.date}) {
            
            self.alarme.remove(at: i)
            return true
        }
        return false
    }
    
    func get(i:Int)->AlarmeMedicament?{
        if(i < 0 || i >= alarme.count){
            return nil
        }
        return self.alarme[i]
    }
    
    func searchByName(date : Date)->AlarmeMedicament?{
        if let i = self.alarme.index(where: { (act) -> Bool in act.date == date as! NSDate}) {
            return self.alarme[i]
        }
        return nil
    }
    
}


