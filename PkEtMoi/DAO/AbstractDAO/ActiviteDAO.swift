//
//  ResumeDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class ActiviteDAO: NSObject {
    
    override init(){
        
    }
    
    internal func _insert(nom:String,description:String)->Bool
    {
        fatalError(#function + "Must be overridden");
        return false;
    }
    
    internal func _delete()->Bool
    {
        fatalError(#function + "Must be overridden");
        return false;
    }
    
    internal func _update(activite : ActiviteModel)->ActiviteModel?
    {
        fatalError(#function + "Must be overridden");
        return nil;
    }
    
    
    func _getName()->String?
    {
        fatalError(#function + "Must be overridden");
        return nil;
    }
    func _setName(forname:String)
    {
        fatalError(#function + "Must be overridden");
    }
    
    func _getDescription()->String?
    {
        fatalError(#function + "Must be overridden");
        return nil;
    }
    func _setDescription(forname:String)
    {
        fatalError(#function + "Must be overridden");
    }
    
    func _getAll() -> ActiviteSet? {
        fatalError(#function + "Must be overridden");
        return nil
    }
    
}

