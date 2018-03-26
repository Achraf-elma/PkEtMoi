//
//  ResumeControllerViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class ResumeViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var resumeTable: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var date :DateHandler = DateHandler()
    var alarmeSet : AlarmeSet = (AbstractDAO.getDAO()!._getAlarmeDAO()?._getAllAlarmes())!

    
    @IBAction func nextDay(_ sender: UIButton) {
        dateLabel.text = date.nextDay()
        alarmeSet = (AbstractDAO.getDAO()?._getAlarmeDAO()?._getAlarmes(date: date.date))!
        resumeTable.reloadData()
    }
    @IBAction func previousDay(_ sender: UIButton) {
        dateLabel.text = date.previousDay()
        alarmeSet = (AbstractDAO.getDAO()?._getAlarmeDAO()?._getAlarmes(date: date.date))!
        resumeTable.reloadData()
    }
   
    override func viewDidAppear(_ animated: Bool) {
        alarmeSet = (AbstractDAO.getDAO()?._getAlarmeDAO()?._getAlarmes(date: date.date))!
        resumeTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if !launchedBefore  {

            let options: UNAuthorizationOptions = [.alert, .sound];
            AppDelegate.center.requestAuthorization(options: options) {
                (granted, error) in
                if !granted {
                    print("Something went wrong")
                }
            }
            
            SpecialiteModel(nom:"Kinésithérapeute")
            SpecialiteModel(nom:"Orthophoniste")
            SpecialiteModel(nom:"Infirmier")
            SpecialiteModel(nom:"Psychologue clinicien")
            SpecialiteModel(nom:"Neuropsychologue")
            SpecialiteModel(nom:"Neurologue")
            SpecialiteModel(nom:"Ergothérapeute")
            SpecialiteModel(nom:"Psychomotricien")
            SpecialiteModel(nom:"Pédicure-podologue")
            SpecialiteModel(nom:"Diététicien(ne)")
            SpecialiteModel(nom:"Orthoptiste")
            SpecialiteModel(nom:"Medecin generaliste")
            
            ActiviteModel(nom: "Musculation", niveau: 0, experience: 0)
            MedicamentModel(nom: "CoDoliprane", description: "Pour la tete",dosage:[32,63]).addAlarme(date: Date())
            var currentDate : Date = Date()
            let rdv = RdvModel(firstname: "Fabrice", lastname: "Monique", adresse: "68 rue dupone", date: currentDate, telephone: "09837293",type:"Neurologue")
            let synthese = SyntheseModel(debut: 7, fin: 18, rdv: rdv)
            for index in 1...5 {
                currentDate = currentDate.addingTimeInterval(-86400)
                synthese.addEtat(date: currentDate, event: String(index), result: "ON")
            }
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
        alarmeSet = (AbstractDAO.getDAO()?._getAlarmeDAO()?._getAlarmes(date: date.date))!
        dateLabel.text = date.currentDate
        resumeTable.delegate = self
        resumeTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.alarmeSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.resumeTable.dequeueReusableCell(withIdentifier: "resumeCell", for: indexPath) as! ResumeTableViewCell
        var type : String = ""
        if (self.alarmeSet.get(i: indexPath.row)?.isRdvAlarme())! {
            type = "RDV "
        }
        else if (self.alarmeSet.get(i: indexPath.row)?.isMedicamentAlarme())!{
            type = "Medicament "
        }
        else{
            type = "Activite "
        }
        cell.labelCell.text = type + (self.alarmeSet.get(i: indexPath.row)?.getLabel())!
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            var type : String = ""
            if (self.alarmeSet.get(i: indexPath.row)?.isRdvAlarme())! {
                type = "rdv"
            }
            else if (self.alarmeSet.get(i: indexPath.row)?.isMedicamentAlarme())!{
                type = "medicament"
            }
            else{
                type = "activite"
            }
            AppDelegate.notification.removeNotification(identifier: [type+DateHandler.toString(date: (self.alarmeSet.get(i: indexPath.row)?.date)!)])
            alarmeSet.delete(alarme: alarmeSet.get(i: indexPath.row)!)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        var cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if(self.alarmeSet.get(i: indexPath.row) is MedicamentModel){
            
        }
        else if(self.alarmeSet.get(i: indexPath.row) is RdvModel){
            
        }
        else if(self.alarmeSet.get(i: indexPath.row) is ActiviteModel){
            
        }
        */
    }
    
}
