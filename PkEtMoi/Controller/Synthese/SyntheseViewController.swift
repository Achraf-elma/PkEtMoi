//
//  ResumeControllerViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit
import CoreData

class SyntheseViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    var synthese : SyntheseModel? = nil
    var etatSet : EtatSet? = nil
    
    @IBOutlet weak var etatTable: UITableView!
    
    @IBOutlet weak var ajoutEtatOutlet: UIBarButtonItem!
    @IBAction func ajoutEtat(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let myVC = storyboard.instantiateViewController(withIdentifier: "etat") as! EtatViewController
        navigationController?.pushViewController(myVC, animated: true)
    }
    @IBOutlet weak var jourLabel: UILabel!
    var currentDay : Int16 = 1
    var currentDate : Date? = nil
    @IBAction func previousDay(_ sender: UIButton) {
        if currentDay == 1{
            return
        }
        else{
            currentDay = currentDay - 1
            currentDate = currentDate?.addingTimeInterval(-86400)
        }
        jourLabel.text = "Jour " + String(currentDay)
        self.etatSet = synthese?.getEtats(date: currentDate!)
        etatTable.reloadData()
    }
    @IBAction func nextDay(_ sender: UIButton) {
        if currentDay == 5{
            return
        }
        else{
            currentDay = currentDay + 1
            currentDate = currentDate?.addingTimeInterval(86400)
        }
        jourLabel.text = "Jour " + String(currentDay)
        self.etatSet = synthese?.getEtats(date: currentDate!)
        etatTable.reloadData()
    }
    @IBAction func archiver(_ sender: UIButton) {
        synthese?.isArchive = true
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let myVC = storyboard.instantiateViewController(withIdentifier: "ancienSynthese") as! AncienSyntheseViewController
        myVC.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(myVC, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !(AbstractDAO.getDAO()?._getSyntheseDAO()?._shouldSyntheseBeFilled())! {
            ajoutEtatOutlet.isEnabled = false
        }
        else{
            ajoutEtatOutlet.isEnabled = true
        }
        synthese = AbstractDAO.getDAO()?._getSyntheseDAO()?._getCurrentSynthese()
        if synthese == nil{
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            
            let myVC = storyboard.instantiateViewController(withIdentifier: "ancienSynthese") as! AncienSyntheseViewController
            myVC.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(myVC, animated: false)
        }
        else{
            currentDate = synthese?.rdv.date
            for _ in 1...5 {
                currentDate = currentDate?.addingTimeInterval(-86400)
            }
            self.etatSet = synthese?.getEtats(date: currentDate!)
            etatTable.reloadData()
            etatTable?.delegate = self
            etatTable?.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !(AbstractDAO.getDAO()?._getSyntheseDAO()?._shouldSyntheseBeFilled())! {
            ajoutEtatOutlet.isEnabled = false
        }
        else{
            ajoutEtatOutlet.isEnabled = true
        }
        jourLabel.text = "Jour " + String(currentDay)
        synthese = AbstractDAO.getDAO()?._getSyntheseDAO()?._getCurrentSynthese()
        if synthese == nil{
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            
            let myVC = storyboard.instantiateViewController(withIdentifier: "ancienSynthese") as! AncienSyntheseViewController
            myVC.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(myVC, animated: false)
        }
        else{
            currentDate = synthese?.rdv.date
            for _ in 1...5 {
                currentDate = currentDate?.addingTimeInterval(-86400)
            }
            self.etatSet = synthese?.getEtats(date: currentDate!)
            etatTable.reloadData()
            etatTable?.delegate = self
            etatTable?.dataSource = self
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.etatSet!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.etatTable?.dequeueReusableCell(withIdentifier: "synthese", for: indexPath) as! SyntheseTableViewCell
        let dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy HH:mm"
        cell.dateLabel.text = dateFormatter.string(from: (self.etatSet?.get(i: indexPath.row)?.date)!)
        cell.etatLabel.text =  self.etatSet?.get(i: indexPath.row)?.reponseEtat
        if cell.etatLabel.text == "ON"{
            cell.backgroundColor = UIColor.green
        }else if cell.etatLabel.text == "OFF"{
            cell.backgroundColor = UIColor(red: (231/255.0), green: (86/255.0), blue: (86/255.0), alpha: 1.0)
        }else{
            cell.backgroundColor = UIColor(red: (76/255.0), green: (190/255.0), blue: (192/255.0), alpha: 1.0)
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //var cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}



