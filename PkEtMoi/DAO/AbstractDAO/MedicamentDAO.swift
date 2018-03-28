//
//  ResumeDAO.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import Foundation
protocol MedicamentDAO {

    //Retourne tous les médicaments.
    func _getAll()-> MedicamentSet?
    
    //Crée un médicament avec son nom, sa description et ses dosages possibles.
    @discardableResult func _insertMedicament(nom:String,description:String,dosage:[Int])->Bool
    
    //Supprime un médicament et renvoie Vrai si la suppression à réussi, Faux sinon.
    @discardableResult func _deleteMedicament()->Bool
    
    //Renvoie le nom du médicament.
    func _getName()->String?
    
    //Affecte le nom du médicament.
    func _setName(forname:String)

    //Renvoie la description du médicament.
    func _getDescription()->String?
    
    //Affecte la description du médicament.
    func _setDescription(forname:String)

    //Renvoie les dpses du médicament.
    func _getDoses()->[Int]
    
    //Définit les doses d'un médicament.
    func _setDoses(forname:[Int])
    
    //Renvoie les alarmes du médicament.
    func _getAlarmes()->AlarmeSet?
    
    //Ajoute une alarme au médicament pour une date donnée
    func _addAlarme(date:Date)
    
    //Supprime une alarme à l'activité pour une date donnée
    func _deleteAlarme(date:Date)
    
}
