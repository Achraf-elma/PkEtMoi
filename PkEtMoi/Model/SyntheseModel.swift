//
//  ActiviteModel.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class SyntheseModel : EventModel{
    
    
    var dao : SyntheseDAO
    
    var isArchive :Bool?{
        get{
            return dao._getArchive()
        }
        set{
            dao._setArchive(archive : newValue!)
        }
    }
    
    var debutPlage :Int16{
        get{
            return dao._getDebutPlageHoraire()
        }
        set{
            dao._setDebutPlageHoraire(debut: newValue)
        }
    }
    
    var finPlage :Int16{
        get{
            return dao._getFinPlageHoraire()
        }
        set{
            dao._setFinPlageHoraire(debut: newValue)
        }
    }
    
    var rdv : RdvModel{
        get{
            return dao._getRdv()
        }
    }
        
    var etat : EtatSet{
        get{
            return dao._getEtats()
        }
    }
    
    init(synthese: SyntheseDAO){
        self.dao = synthese
    }
    
    func getLabel() -> String? {
        return nil
    }
    
    init(debut:Int16, fin:Int16,rdv:RdvModel){
        dao = (AbstractDAO.getDAO()?._getSyntheseDAO()!)!
        dao._insert(archive:false,debut:debut, fin: fin,rdv:rdv)
    }
    
    func addEtat(date: Date, event: String, result: String){
        dao._addEtat(date: date, event: event, result: result)
    }
    
    @discardableResult  func delete() ->Bool{
        return false
    }
    
    func getEtats(date:Date)->EtatSet{
        return dao._getEtats(date:date)
    }
    
}

