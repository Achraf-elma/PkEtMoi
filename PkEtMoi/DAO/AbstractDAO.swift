//
//  AbstractDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation

class AbstractDAO: NSObject {
    
    static let type : String = "coreData"
    static let coreDataDAO : AbstractDAO  = CoreDataDAO()
    
    public static func getDAO()->AbstractDAO?
    {
        if(self.type == "coreData")
        {
            return self.coreDataDAO
        }else{
            return nil
        }
    }
    
    func _getMedicamentDAO()->MedicamentDAO?
    {
        fatalError(#function + "Must be overridden");
    }
    
    func _getActiviteDAO()->ActiviteDAO?
    {
        fatalError(#function + "Must be overridden");
    }
    
    func _getRdvDAO()->RdvDAO?
    {
        fatalError(#function + "Must be overridden");
    }
    
    func _getAlarmeDAO()->AlarmeDAO?{
        fatalError(#function + "Must be overridden");
    }
}
