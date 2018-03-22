//
//  AlarmeMedicamentDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 21/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol AlarmeMedicamentDAO{
    
    func _getAllMedicamentAlarmes()->[AlarmeMedicament]
    func _getAllMedicamentAlarmes(date:Date)

}
