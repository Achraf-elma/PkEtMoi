//
//  MedicamentSet.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 20/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class ActiviteSet{
    
    var activites : [ActiviteModel] = []
    
    var count :Int{
        get{
            return activites.count
        }
    }
    
    init(){
        
    }
    
    init(activite:[ActiviteModel]){
        self.activites = activite
    }
    
    @discardableResult func insert(activite : ActiviteModel)->Bool{
        self.activites.append(activite)
        return true
    }
    
    @discardableResult func delete(activites : ActiviteModel)->Bool{
        if let i = self.activites.index(where: {$0.nom == activites.nom}) {
             self.activites[i].delete()
            self.activites.remove(at: i)
            return true
        }
        return false
    }
    
    func get(i:Int)->ActiviteModel?{
        if(i < 0 || i >= activites.count){
            return nil
        }
        return self.activites[i]
    }
    
    func searchByName(name : String)->ActiviteModel?{
        if let i = self.activites.index(where: { (act) -> Bool in act.nom == name}) {
            return self.activites[i]
        }
        return nil
    }
    
}

