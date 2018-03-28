//
//  EtatDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 24/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol EtatDAO{
    
    //Renvoie la date de l'état
    func _getDate()->Date

    //Renvoie l'évènement particulier lié à l'état
    func _getEvenementParticulier()->String
    
    //Affecte un évènement particulier à l'état
    func _setEvenementParticulier(event:String)
    
    //Récupère la réponse (ON/OFF/DYSKINESIES) du questionnaire
    func _getReponseEtat()->String
    
    //Attribue une réponse du questionnaire.
    func _setReponseEtat(event:String)

}
