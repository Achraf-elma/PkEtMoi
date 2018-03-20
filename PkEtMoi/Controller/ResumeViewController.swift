//
//  ResumeControllerViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit
import CoreData

class ResumeViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,isAbleToReceiveData {
    
    func pass(data: String) {
        print(data)
    }
    
    @IBOutlet weak var resumeTable: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var notification : [Notification] = []
    var date :DateHandler = DateHandler()
    
    @IBAction func nextDay(_ sender: UIButton) {
        dateLabel.text = date.nextDay()
    }
    @IBAction func previousDay(_ sender: UIButton) {
        dateLabel.text = date.previousDay()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = date.currentDate
        notification.append(MedicamentModel(nom: "Hey", description: "wow"))
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
    
    func saveNewResume(with resumeString: String){
        let notificationAdded:MedicamentModel? = AbstractDAO.getDAO()._getMedicamentDAO()?._insertMedicament(nom: "OMG",description:"salut") as? MedicamentModel
        if(notificationAdded != nil){
            self.notification.append(notificationAdded!)
            self.resumeTable.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notification.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.resumeTable.dequeueReusableCell(withIdentifier: "resumeCell", for: indexPath) as! ResumeTableViewCell
        cell.labelCell.text = self.notification[indexPath.row].getLabel()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if(self.notification[indexPath.row] is MedicamentModel){
            let myVC = storyboard.instantiateViewController(withIdentifier: "detailMedicament") as! DetailMedicamentViewController
            myVC.nomMedicament = "hey"
            myVC.descriptionMedicament = "wow"
            navigationController?.pushViewController(myVC, animated: true)
        }
        else if(self.notification[indexPath.row] is RdvModel){
            let myVC = storyboard.instantiateViewController(withIdentifier: "detailRdv") as! DetailRdvViewController
            navigationController?.pushViewController(myVC, animated: true)
        }
        else if(self.notification[indexPath.row] is ActiviteModel){
            let myVC = storyboard.instantiateViewController(withIdentifier: "detailActivite") as! DetailActiviteViewController
            navigationController?.pushViewController(myVC, animated: true)
        }
        
    }
    
}
