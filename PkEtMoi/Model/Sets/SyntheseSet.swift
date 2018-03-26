//
//  MedicamentSet.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 20/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class SyntheseSet{
    
    var synthese : [SyntheseModel] = []
    
    var count :Int{
        get{
            return synthese.count
        }
    }
    
    init(){
        
    }
    
    init(synthese:[SyntheseModel]){
        self.synthese = synthese
    }
    
    @discardableResult func insert(synthese : SyntheseModel)->Bool{
        self.synthese.append(synthese)
        return true
    }
    
    func get(i:Int)->SyntheseModel?{
        if(i < 0 || i >= synthese.count){
            return nil
        }
        return self.synthese[i]
    }
    
}





