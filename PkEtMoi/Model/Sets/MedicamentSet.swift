//
//  MedicamentSet.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 20/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class MedicamentSet{
    
    var medicaments : [MedicamentModel] = []
    
    var count :Int{
        get{
            return medicaments.count
        }
    }
    
    init(){
        
    }
    
    init(medicaments:[MedicamentModel]){
        self.medicaments = medicaments
    }
    
    func insert(medicament : MedicamentModel)->Bool{
        self.medicaments.append(medicament)
        return true
    }
    
    func delete(medicament : MedicamentModel)->Bool{
        if let i = self.medicaments.index(where: {$0.nom == medicament.nom}) {
            self.medicaments[i].delete()
            self.medicaments.remove(at: i)
            return true
        }
        return false
    }
    
    func get(i:Int)->MedicamentModel?{
        if(i < 0 || i >= medicaments.count){
            return nil
        }
        return self.medicaments[i]
    }
    
    func searchByName(name : String)->MedicamentModel?{
        if let i = self.medicaments.index(where: { (med) -> Bool in med.nom == name}) {
            return self.medicaments[i]
        }
        return nil
    }
    
}
