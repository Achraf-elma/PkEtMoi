//
//  ActiviteModel.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class ActiviteModel : EventModel{
   
    
    var dao : ActiviteDAO
    
    var nom :String?{
        get{
            return dao._getName()
        }
        set{
            dao._setName(forname : newValue as! String)
        }
    }
    
    var niveau :Int16{
        get{
            return dao._getNiveau()
        }
        set{
            dao._setNiveau(niveau : newValue as! Int16)
        }
    }
    
    var experience :Int16{
        get{
            return dao._getExperience()
        }
        set{
            dao._setExperience(experience : newValue as! Int16)
        }
    }
    
    var alarmes : AlarmeSet{
        get{
            return dao._getAlarmes()!
        }
    }
    
    init(activite: ActiviteDAO){
        self.dao = activite
    }
    
    func getLabel() -> String? {
        return nom
    }
    
    init(nom:String,niveau:Int16, experience:Int16){
        dao = (AbstractDAO.getDAO()?._getActiviteDAO()!)!
        dao._insert(nom:nom, niveau:niveau, experience: experience)
    }
    
    func delete() ->Bool{
        return dao._delete()
    }
    
    func addAlarme(date:Date){
        dao._addAlarme(date: date)
    }
    
    func deleteAlarme(date:Date){
        dao._deleteAlarme(date: date)
    }
    
    func incExperience(){
        if experience == 9{
            experience = 0
            niveau = niveau + 1
        }
        else{
            experience = experience + 1
        }
    }
}
