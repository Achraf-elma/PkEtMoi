//
//  AlarmeDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 22/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol AlarmeDAO{
    
    //Retourne toutes les alarmes
    func _getAllAlarmes()->AlarmeSet?
    
    //Retourne les alarmes correspondantes à une date donnée.
    func _getAlarmes(date:Date)->AlarmeSet?
    
    //Supprime l’alarme et renvoie Vrai si la suppression a bien été effectuée, Faux sinon.
    @discardableResult func _deleteAlarm()->Bool
    
    //Retourne la date de l'alarme.
    func _getDate()->Date?
    
    //Retourne vrai si l’alarme est pour un médicament.
    func _isMedicamentAlarm()->Bool
    
    //Retourne vrai si l’alarme est pour un rendez-vous.
    func _isRdvAlarme()->Bool
    
    //Retourne vrai si l’alarme est pour une activité.
    func _isActiviteAlarme()->Bool
}

