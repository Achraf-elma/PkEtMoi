//
//  SpecialiteModel.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 25/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class SpecialiteModel{
    
    
    var dao : SpecialiteDAO
    
    var nom :String?{
        get{
            return dao._getNom()
        }
        set{
            dao._setNom(nom : newValue!)
        }
    }
    
    init(specialite: SpecialiteDAO){
        self.dao = specialite
    }
    
    init(nom:String){
        dao = (AbstractDAO.getDAO()?._getSpecialiteDAO()!)!
        dao._insertSpecialite(nom:nom)
    }
    
}
