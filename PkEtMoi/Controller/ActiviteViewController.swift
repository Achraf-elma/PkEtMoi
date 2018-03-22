//
//  ResumeControllerViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit
import CoreData

class ActiviteViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    

    var eventSet : EventSet? = nil
    
    static var date :DateHandler  = DateHandler()
    
    var index : Int? = nil
    var currentLabel : UILabel? = nil
    var currentTable :UITableView? = nil
    var identifierCell : String? = nil
    
    @IBOutlet weak var dateLabelActivite: UILabel!
    @IBOutlet weak var activiteTable: UITableView!
    
    @IBOutlet weak var rdvTable: UITableView!
    @IBOutlet weak var dateLabelRdv: UILabel!
    
    @IBOutlet weak var medicamentTable: UITableView!
    @IBOutlet weak var dateLabelMedicament: UILabel!
    
    func initValuesDependingOnTab(){
        let application = UIApplication.shared.delegate as! AppDelegate
        let tabbarController = application.window?.rootViewController as! UITabBarController
        self.index = tabbarController.selectedIndex
        if(self.index == 1){
            dateLabelMedicament.text = ActiviteViewController.date.currentDate
            self.currentLabel = dateLabelMedicament
            self.eventSet = EventSet(medicamentSet:(AbstractDAO.getDAO()._getMedicamentDAO()?._getAll()))
            self.currentTable = medicamentTable
            self.identifierCell = "medicamentCell"
            currentTable?.delegate = self
            currentTable?.dataSource = self
        }
        else if(self.index == 2){
            dateLabelRdv.text = ActiviteViewController.date.currentDate
            self.currentLabel = dateLabelRdv
            self.eventSet = EventSet(rdvSet:(AbstractDAO.getDAO()._getRdvDAO()?._getAll())!)
            self.currentTable = rdvTable
            self.identifierCell = "rdvCell"
            currentTable?.delegate = self
            currentTable?.dataSource = self
        }
        else{
            dateLabelActivite.text = ActiviteViewController.date.currentDate
            self.eventSet = EventSet(activiteSet:(AbstractDAO.getDAO()._getActiviteDAO()?._getAll())!)
            self.currentTable = activiteTable
            self.identifierCell = "activiteCell"
            currentTable?.delegate = self
            currentTable?.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValuesDependingOnTab()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventSet!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(index == 1){
            let cell = self.currentTable?.dequeueReusableCell(withIdentifier: self.identifierCell!, for: indexPath) as! MedicamentTableViewCell
            cell.labelCell.text = self.eventSet?.get(i: indexPath.row)?.getLabel()
            return cell
        }
        else if(index == 2){
            let cell = self.currentTable?.dequeueReusableCell(withIdentifier: self.identifierCell!, for: indexPath) as! rdvTableViewCell
            cell.labelCell.text = self.eventSet?.get(i: indexPath.row)?.getLabel()
            return cell
        }
        else{
            let cell = self.currentTable?.dequeueReusableCell(withIdentifier: self.identifierCell!, for: indexPath) as! ActiviteTableViewCell
            cell.labelCell.text = self.eventSet?.get(i: indexPath.row)?.getLabel()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //var cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
      
        if(index == 1){
             let myVC = storyboard.instantiateViewController(withIdentifier: "detailMedicament") as! DetailMedicamentViewController
            myVC.medicament = eventSet?.get(i: indexPath.row) as! MedicamentModel
            navigationController?.pushViewController(myVC, animated: true)
        }
        else if(index == 2){
            let myVC = storyboard.instantiateViewController(withIdentifier: "detailRdv") as! DetailRdvViewController
            myVC.rdv = eventSet?.get(i: indexPath.row) as! RdvModel
            navigationController?.pushViewController(myVC, animated: true)
        }
        else{
            let myVC = storyboard.instantiateViewController(withIdentifier: "detailActivite") as! DetailActiviteViewController
            myVC.activite = eventSet?.get(i: indexPath.row) as! ActiviteModel
            navigationController?.pushViewController(myVC, animated: true)
        }

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            eventSet?.delete(eventToDelete: (eventSet?.get(i: indexPath.row)!)!)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func nextDayMedicament(_ sender: UIButton) {
        dateLabelMedicament.text = ActiviteViewController.date.nextDay()
    }
    @IBAction func previousDayMedicament(_ sender: UIButton) {
        dateLabelMedicament.text = ActiviteViewController.date.previousDay()
    }
    @IBAction func previousDayActivite(_ sender: UIButton) {
        dateLabelActivite.text = ActiviteViewController.date.previousDay()
    }
    @IBAction func nextDayActivite(_ sender: UIButton) {
        dateLabelActivite.text = ActiviteViewController.date.nextDay()
    }
    
    @IBAction func previousDayRdv(_ sender: UIButton) {
        dateLabelRdv.text = ActiviteViewController.date.previousDay()
    }
    @IBAction func nextDayRdv(_ sender: UIButton) {
        dateLabelRdv.text = ActiviteViewController.date.nextDay()
    }
    override func viewDidAppear(_ animated: Bool) {
        initValuesDependingOnTab()
    }
    
}


