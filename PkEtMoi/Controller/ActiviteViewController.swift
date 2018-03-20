//
//  ResumeControllerViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit
import CoreData

class ActiviteViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,isAbleToReceiveData {
    
    func pass(data: String) {
        print(data)
    }
    
    

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var resumeTable: UITableView!
    
    var activiteSet : ActiviteSet = (AbstractDAO.getDAO()._getActiviteDAO()?._getAll()!)!
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
        activiteSet.insert(activite: ActiviteModel(nom: "Hey", description: "wow"))
        let application = UIApplication.shared.delegate as! AppDelegate
        let tabbarController = application.window?.rootViewController as! UITabBarController
         print(tabbarController.selectedIndex)
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
        return self.activiteSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.resumeTable.dequeueReusableCell(withIdentifier: "activiteCell", for: indexPath) as! ActiviteTableViewCell
        cell.labelCell.text = self.activiteSet.get(i: indexPath.row)?.getLabel()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //var cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let myVC = storyboard.instantiateViewController(withIdentifier: "detailActivite") as! DetailActiviteViewController
        //myVC.nomMedicament = (activiteSet.get(i: indexPath.row)?.nom)!
        //myVC.descriptionMedicament = (activiteSet.get(i: indexPath.row)?.description)!
        
        navigationController?.pushViewController(myVC, animated: true)
    }
    
}


