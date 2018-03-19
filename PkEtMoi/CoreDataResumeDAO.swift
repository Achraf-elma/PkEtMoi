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

class CoreDataResumeDAO : ResumeDAO{
    
    override init(){
        
    }
    
    override func _insertResume(resume : ResumeModel)->ResumeModel?
    {
        let resumeToAdd = NSEntityDescription.insertNewObject(forEntityName: "Resume", into: CoreDataDAO.context) as! Resume
        
        resumeToAdd.label = resume.label
        do{
            try CoreDataDAO.context.save()
            return resume
        }
        catch let error as NSError{
            print(error)
            return nil
        }
    }
    
}
