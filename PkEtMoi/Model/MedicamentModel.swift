//
//  MedicamentModel.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class MedicamentModel:EventModel{
    
    var dao : MedicamentDAO
    
    var nom :String?{
        get{
            return dao._getName()
        }
        set{
            dao._setName(forname : newValue!)
        }
    }
    
    var description :String?{
        get{
            return dao._getDescription()
        }
        set{
            dao._setDescription(forname : newValue!)
        }
    }
    
    var doses :[DosesModel]?{
        get{
            return dao._getDoses()
        }
        set{
            dao._setDoses(forname : newValue!)
        }
    }
    
    var alarmes : AlarmeSet?{
        get{
            return dao._getAlarmes()
        }
    }
    
    init(medicament: MedicamentDAO){
        self.dao = medicament
    }
    
    func getLabel() -> String? {
        return nom
    }
    
    init(nom:String, description:String){
        dao = (AbstractDAO.getDAO()?._getMedicamentDAO()!)!
        dao._insertMedicament(nom:nom, description:description)
    }
    
    @discardableResult  func delete() ->Bool{
        return dao._deleteMedicament()
    }
    
    func addAlarme(date:Date){
        dao._addAlarme(date: date)
    }
    
    func deleteAlarme(date:Date){
        dao._deleteAlarme(date: date)
    }
    
}
