//
//  ActiviteModel.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class ActiviteModel : Notification{
   
    
    var dao : ActiviteDAO
    
    var nom :String?{
        get{
            return dao._getName()
        }
        set{
            dao._setName(forname : newValue as! String)
        }
    }
    
    var description :String?{
        get{
            return dao._getDescription()
        }
        set{
            dao._setDescription(forname : newValue as! String)
        }
    }
    /*
     var doses : [DosesModel]{
     get{
     return dao._getDoses()!
     }
     set{
     dao._setDoses(forname : newValue)
     }
     }*/
    
    init(activite: ActiviteDAO){
        self.dao = activite
    }
    
    func getLabel() -> String? {
        return nom
    }
    
    init(nom:String, description:String){
        dao = AbstractDAO.getDAO()._getActiviteDAO()!
        dao._insert(nom:nom, description:description)
    }
    
    func delete() ->Bool{
        return dao._delete()
    }
}
