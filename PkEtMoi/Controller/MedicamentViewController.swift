//
//  ResumeControllerViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit
import CoreData

class MedicamentViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,isAbleToReceiveData {
    
    func pass(data: String) {
        print(data)
    }
    
    
    @IBOutlet weak var resumeTable: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var medicamentSet : MedicamentSet = (AbstractDAO.getDAO()._getMedicamentDAO()?._getAll()!)!
    var date :DateHandler = DateHandler()


    @IBAction func previousDay(_ sender: UIButton) {
        dateLabel.text = date.previousDay()
        
    }
    
    @IBAction func nextDay(_ sender: UIButton) {
        dateLabel.text = date.nextDay()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = date.currentDate
        medicamentSet.insert(medicament: MedicamentModel(nom: "Hey", description: "wow"))
        medicamentSet.delete(medicament: medicamentSet.searchByName(name: "Hey")!)
        /*
         self.saveNewResume(with: "wow")
         self.notification.append(ActiviteModel(label:"salut", date: Date()))
         self.notification.append(RdvModel(label:"oula", date: Date()))*/
        resumeTable.delegate = self
        resumeTable.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.medicamentSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.resumeTable.dequeueReusableCell(withIdentifier: "medicamentCell", for: indexPath) as! MedicamentTableViewCell
        cell.labelCell.text = self.medicamentSet.get(i: indexPath.row)?.getLabel()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //var cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let myVC = storyboard.instantiateViewController(withIdentifier: "detailMedicament") as! DetailMedicamentViewController
        myVC.nomMedicament = (medicamentSet.get(i: indexPath.row)?.nom)!
        myVC.descriptionMedicament = (medicamentSet.get(i: indexPath.row)?.description)!
        
        navigationController?.pushViewController(myVC, animated: true)
    }
    
}

