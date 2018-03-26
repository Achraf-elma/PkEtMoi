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
        var currentDate = rdv.date
        currentDate?.addingTimeInterval(-86400)
        for i in 1...5{
            for index in debut...fin {
                var tmp = currentDate
                var time:Double = Double((24 - fin + index)) * 3600.0
                tmp?.addingTimeInterval(time)
                AppDelegate.notification.addNotification(title: "Synthese", body: "Rentrez votre etat", date: tmp!, identifier: "synthese")
            }
            currentDate?.addingTimeInterval(-86400)
        }
    }
    
    func addEtat(date: Date, result: String){
        dao._addEtat(date: date, result: result)
    }
    
    @discardableResult  func delete() ->Bool{
        return false
    }
    
    func getEtats(date:Date)->EtatSet{
        return dao._getEtats(date:date)
    }
    
}

