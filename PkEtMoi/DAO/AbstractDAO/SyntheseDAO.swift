//
//  SyntheseDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 24/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol SyntheseDAO{
    
    //Crée une synthèse vide pour une plage horaire de réponses au questionnaire donnée. Le booléen correspond au fait qu’elle soit archivée ou non.
    func _insert(archive:Bool,debut:Int16, fin: Int16,rdv:RdvModel)
    
    //Récupère toutes les synthèses
    func _getAll()->SyntheseSet
    
    //Retourne le début de la plage horaire.
    func _getDebutPlageHoraire()->Int16
    
    //Définit le début de la plage horaire.
    func _setDebutPlageHoraire(debut:Int16)
    
    //Retourne la fin de la plage horaire.
    func _getFinPlageHoraire()->Int16
    
    //Définit le début de la plage horaire.
    func _setFinPlageHoraire(debut:Int16)
    
    //Renvoie le rendez-vous de la synthèse.
    func _getRdv()->RdvModel
    
    //Affecte un rendez-vous à la synthèse.
    func _setRdv(rdv:RdvModel)
    
    //Renvoie les états liés à la synthèse.
    func _getEtats()->EtatSet
    
    //Renvoie les états liés à la synthèse pour une date donnée.
    func _getEtats(date:Date)->EtatSet
    
    //Ajoute un état à la synthèse.
    func _addEtat(date:Date,result:String)
    
    //Retourne la synthèse actuelle.
    func _getCurrentSynthese()->SyntheseModel?
    
    //Retourne vrai si la synthèse est archivée, faux sinon.
    func _getArchive()->Bool
    
    //Archive la synthèse si on entre Vrai, ne l’archive pas sinon.
    func _setArchive(archive:Bool)
    func _shouldSyntheseBeFilled()->Bool
    
}
