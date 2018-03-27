//
//  MedicamentSet.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 20/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class EtatSet{
    
    var etat : [EtatModel] = []
    
    var count :Int{
        get{
            return etat.count
        }
    }
    
    init(){
        
    }
    
    init(etat:[EtatModel]){
        self.etat = etat
    }
    
    @discardableResult func insert(etat : EtatModel)->Bool{
        self.etat.append(etat)
        return true
    }
    
    @discardableResult func delete(etat : EtatModel)->Bool{
        if let i = self.etat.index(where: {$0.date == etat.date}) {
            self.etat.remove(at: i)
            return true
        }
        return false
    }
    
    func get(i:Int)->EtatModel?{
        if(i < 0 || i >= etat.count){
            return nil
        }
        return self.etat[i]
    }
    
    func searchByDate(date : Date)->EtatModel?{
        if let i = self.etat.index(where: { (act) -> Bool in act.date == date}) {
            return self.etat[i]
        }
        return nil
    }
    
}




