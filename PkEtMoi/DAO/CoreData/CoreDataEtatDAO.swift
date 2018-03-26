//
//  CoreDataEtatDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 24/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class CoreDataEtatDAO:EtatDAO{
    
    var instanceCoreData: Etat? = nil
    
    init(etat : Etat){
        self.instanceCoreData = etat
    }
    
    init(){
        
    }
    
    
    func _getDate() -> Date {
        return (instanceCoreData?.date)!
    }
    
    func _getEvenementParticulier() -> String {
        return (instanceCoreData?.evenementParticulier)!
    }
    
    func _setEvenementParticulier(event: String) {
        
    }
    
    func _getReponseEtat() -> String {
        return (instanceCoreData?.reponseEtat)!
    }
    
    func _setReponseEtat(event: String) {
        
    }
    
    
}
