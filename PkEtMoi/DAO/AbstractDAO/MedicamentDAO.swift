//
//  ResumeDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class MedicamentDAO: NSObject {
    
    override init(){
        
    }
    
    internal func _insertMedicament(nom:String,description:String)->Bool
    {
        fatalError(#function + "Must be overridden");
        return false;
    }
    
    internal func _deleteMedicament(medicament : MedicamentModel)->Bool?
    {
        fatalError(#function + "Must be overridden");
        return nil;
    }
    
    internal func _updateMedicament(medicament : MedicamentModel)->MedicamentModel?
    {
        fatalError(#function + "Must be overridden");
        return nil;
    }
    
    
    internal func _getName()->String?
    {
        fatalError(#function + "Must be overridden");
        return nil;
    }
    internal func _setName(forname:String)
    {
        fatalError(#function + "Must be overridden");
    }
    
    internal func _getDescription()->String?
    {
        fatalError(#function + "Must be overridden");
        return nil;
    }
    internal func _setDescription(forname:String)
    {
        fatalError(#function + "Must be overridden");
    }
    
    internal func _getDoses()->[DosesModel]?
    {
        fatalError(#function + "Must be overridden");
        return nil;
    }
    internal func _setDoses(forname:[DosesModel])
    {
        fatalError(#function + "Must be overridden");
    }
    
}
