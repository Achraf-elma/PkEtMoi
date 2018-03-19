//
//  ResumeDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class MedicamentDAO: NSObject {
    
    static let type : String = "coreData"
    static let coreDataDAO : AbstractDAO  = CoreDataDAO()
    
    override init(){
    }
    
    internal func _insertMedicament(medicament : MedicamentModel)->MedicamentModel?
    {
        fatalError(#function + "Must be overridden");
        return nil;
    }
}
