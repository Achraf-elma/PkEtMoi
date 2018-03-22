//
//  RdvSet.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 21/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class RdvSet{
    
    var rdv : [RdvModel] = []
    
    var count :Int{
        get{
            return rdv.count
        }
    }
    
    init(){
        
    }
    
    init(rdv:[RdvModel]){
        self.rdv = rdv
    }
    
    func insert(rdv : RdvModel)->Bool{
        self.rdv.append(rdv)
        return true
    }
    
    func delete(rdv : RdvModel)->Bool{
        if let i = self.rdv.index(where: {$0.adresse == rdv.adresse}) {
             self.rdv[i].delete()
            self.rdv.remove(at: i)
            return true
        }
        return false
    }
    
    func get(i:Int)->RdvModel?{
        if(i < 0 || i >= rdv.count){
            return nil
        }
        return self.rdv[i]
    }
    
    func searchByAdresse(adresse : String)->RdvModel?{
        if let i = self.rdv.index(where: { (act) -> Bool in act.adresse == adresse}) {
            return self.rdv[i]
        }
        return nil
    }
    
}
