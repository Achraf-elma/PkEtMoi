//
//  MedicamentModel.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class EtatModel{
    
    var dao : EtatDAO
    
    var date :Date?{
        get{
            return dao._getDate()
        }
    }
    
    var evenementParticulier :String?{
        get{
            return dao._getEvenementParticulier()
        }
        set{
            dao._setEvenementParticulier(event : newValue!)
        }
    }
    
    var reponseEtat :String?{
        get{
            return dao._getReponseEtat()
        }
        set{
            dao._setReponseEtat(event : newValue!)
        }
    }
    
    init(date:Date, reponse:String){
        var synthese = AbstractDAO.getDAO()?._getSyntheseDAO()?._getCurrentSynthese()
        synthese?.addEtat(date: date,result: reponse)
        dao = (AbstractDAO.getDAO()?._getEtatDAO())!
    }
    
    init(etat: EtatDAO){
        self.dao = etat
    }
    
    func getLabel()->String{
        return DateHandler(date: self.date!, formatter: "MMM dd, yyyy HH:mm").currentDate
    }
    
}


