//
//  RdvDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 21/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol RdvDAO{
    
    //Retourne tous les rendez-vous
    func _getAll() -> RdvSet?
    
      //Crée un rendez-vous avec l'adresse, la date du rdv, le nom, prénom, numéro de téléphone du médecin, spécialité
    @discardableResult func _insert(adresse:String,date:Date,nom:String,prenom:String,telephone:String,type:String)->Bool
    
    //Supprime un rendez-vous et renvoie Vrai si la suppression a bien été effectuée, Faux sinon.
    @discardableResult func _delete()->Bool
    
    //Modifie le rendez-vous
    @discardableResult func _update(rdv : RdvModel)->RdvModel?
    
    //Retourne le prénom du médecin du rendez-vous
    func _getFirstName()->String?
    
    //Affecte le prénom du médecin du rendez-vous
    func _setFirstName(forname:String)
    
    //Retourne le nom du médecin du rendez-vous
    func _getLastName()->String?
    
    //Affecte le nom du médecin du rendez-vous
    func _setLastName(forname:String)
    
    //Retourne le téléphone du médecin du rendez-vous
    func _getPhone()->String?
    
    //Affecte le téléphone du médecin du rendez-vous
    func _setPhone(forname:String)

    //Retourne la spécialité du médecin du rendez-vous
    func _getType()->String?
    
    //Affecte la spécialité du médecin du rendez-vous
    func _setType(forname:String)
    
    //Retourne l'adresse du médecin du rendez-vous
    func _getAdresse()->String?
    
    //Affecte l'adresse du médecin du rendez-vous
    func _setAdresse(forname:String)
    
    //Retourne la date du rendez-vous
    func _getDate()->Date?
    
    //Affecte la date du rendez-vous
    func _setDate(forname:Date)
    
    //Retourne les alarmes du rendez-vous
    func _getAlarmes()->AlarmeSet?
    
    //Ajoute une alarme au rendez-vous pour une date donnée
    func _addAlarme(date:Date)
    
    //Supprime une alarme au rendez-vous pour une date donnée
    func _deleteAlarme(date:Date)
    
    //Renvoie la synthèse associée au rendez-vous. Ne renvoie rien si le rendez-vous n'est pas avec un neurologue.
    func _getSynthese()->Synthese?
    
    //Attribue une synthèse au rendez-vous. Possible uniquement pour un rendez-vous chez le neurologue.
    func _setSynthese(synthese:Synthese)
    
    //Retourne le médecin du rendez-vous
    func _getMedecin()->Medecin?
    
    //Affecte un médecin au rendez-vous
    func _setMedecin(nom:String,prenom:String,adresse:String,telephone:Int32,specialite:Specialite)
    
    //Renvoie le prochain rendez-vous avec un neurologue
    func _getNextNeurologueRdv()->RdvModel?
}
