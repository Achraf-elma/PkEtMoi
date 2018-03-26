//
//  MedicamentSet.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 20/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class SpecialiteSet{
    
    var specialite : [SpecialiteModel] = []
    
    var count :Int{
        get{
            return specialite.count
        }
    }
    
    init(){
        
    }
    
    init(specialite:[SpecialiteModel]){
        self.specialite = specialite
    }
    
    @discardableResult func insert(specialite : SpecialiteModel)->Bool{
        self.specialite.append(specialite)
        return true
    }
    
    func get(i:Int)->SpecialiteModel?{
        if(i < 0 || i >= specialite.count){
            return nil
        }
        return self.specialite[i]
    }
    
}






