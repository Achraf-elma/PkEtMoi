//
//  ResumeDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol ActiviteDAO{
    
    //Retourne toutes les activités.
    func _getAll() -> ActiviteSet?
    
    //Crée une activité à partir d’un nom. Le niveau et l'expérience sont nuls par défaut.
    @discardableResult func _insert(nom:String,niveau:Int16,experience:Int16)->Bool
    
    //Supprime une activité et renvoie Vrai si la suppression a bien été effectuée, Faux sinon.
    @discardableResult func _delete()->Bool
    
    //Modifie l'activité
    @discardableResult func _update(activite : ActiviteModel)->ActiviteModel?
    
    //Retourne le nom de l'activité.
    func _getName()->String?
    
    //Affecte le nom de l'activité.
    func _setName(forname:String)
    
    //Retourne l'expérience du patient dans l'activité.
    func _getExperience()->Int16
    
    //Affecte l'expérience du patient dans l'activité.
    func _setExperience(experience:Int16)
    
    //Retourne le niveau du patient dans l'activité.
    func _getNiveau()->Int16
    
    //Affecte le niveau du patient dans l'activité.
    func _setNiveau(niveau:Int16)
    
    //Renvoie les alarmes de l'activité.
    func _getAlarmes()->AlarmeSet?
    
    //Ajoute une alarme à l'activité pour une date donnée
    func _addAlarme(date:Date)
    
    //Supprime une alarme à l'activité pour une date donnée
    func _deleteAlarme(date:Date)
}

