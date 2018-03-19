//
//  CoreDataResumeDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataMedicamentDAO : MedicamentDAO{
    
    override init(){
        
    }
    
    override func _insertMedicament(medicament : MedicamentModel)->MedicamentModel?
    {
        let notificationToAdd = NSEntityDescription.insertNewObject(forEntityName: "Medicament", into: CoreDataDAO.context) as! Medicament
        
        notificationToAdd.label = medicament.getLabel()
        notificationToAdd.date = medicament.getDate() as NSDate
        do{
            try CoreDataDAO.context.save()
            return medicament
        }
        catch let error as NSError{
            print(error)
            return nil
        }
    }
    
}
