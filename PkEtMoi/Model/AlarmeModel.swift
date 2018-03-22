//
//  MedicamentModel.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
class AlarmeModel{
    
    var dao : AlarmeDAO
    
    var date :Date?{
        get{
            return dao._getDate()
        }
    }
    
    init(alarme: AlarmeDAO){
        self.dao = alarme
    }
    
    func delete() ->Bool{
        return dao._deleteAlarm()
    }
    
    func isMedicamentAlarme()->Bool{
        return dao._isMedicamentAlarm()
    }
    
    func isRdvAlarme()->Bool{
        return dao._isRdvAlarme()
    }
    
    func isActiviteAlarme()->Bool{
        return dao._isActiviteAlarme()
    }
    
    func getLabel()->String{
        return DateHandler(date: self.date!, formatter: "MMM dd, yyyy HH:mm").currentDate
    }

}

