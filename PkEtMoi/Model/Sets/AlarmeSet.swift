//
//  MedicamentSet.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 20/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class AlarmeSet{
    
    var alarme : [AlarmeModel] = []
    
    var count :Int{
        get{
            return alarme.count
        }
    }
    
    init(){
        
    }
    
    init(alarme:[AlarmeModel]){
        self.alarme = alarme
    }
    
    @discardableResult func insert(alarme : AlarmeModel)->Bool{
        self.alarme.append(alarme)
        return true
    }
    
    @discardableResult func delete(alarme : AlarmeModel)->Bool{
        if let i = self.alarme.index(where: {$0.date == alarme.date}) {
            self.alarme[i].delete()
            self.alarme.remove(at: i)
            return true
        }
        return false
    }
    
    func get(i:Int)->AlarmeModel?{
        if(i < 0 || i >= alarme.count){
            return nil
        }
        return self.alarme[i]
    }
    
    func searchByDate(date : Date)->AlarmeModel?{
        if let i = self.alarme.index(where: { (act) -> Bool in act.date == date}) {
            return self.alarme[i]
        }
        return nil
    }
    
}



