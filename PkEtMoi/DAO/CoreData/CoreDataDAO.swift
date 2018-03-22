//
//  CoreDataDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class CoreDataDAO : AbstractDAO{
    
    public static let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    override func _getMedicamentDAO() -> MedicamentDAO {
        return CoreDataMedicamentDAO()
    }
    
    override func _getActiviteDAO()->ActiviteDAO?
    {
        return CoreDataActiviteDAO()
    }
    
    override func _getRdvDAO()->RdvDAO?
    {
        return CoreDataRdvDAO()
    }
    
    override func _getAlarmeDAO()->AlarmeDAO?
    {
        return CoreDataAlarmeDAO()
    }
    
}
