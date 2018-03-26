//
//  ResumeControllerViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit
import CoreData

class RdvViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    
    var eventSet : EventSet? = nil
    
    @IBAction func ajoutRdv(_ sender: UIButton) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "ajoutRdv") as! AjoutRdvViewController
        navigationController?.pushViewController(myVC, animated: true)
    }
    @IBOutlet weak var rdvTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventSet = EventSet(rdvSet:(AbstractDAO.getDAO()?._getRdvDAO()?._getAll())!)
        rdvTable?.delegate = self
        rdvTable?.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventSet!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = self.rdvTable?.dequeueReusableCell(withIdentifier: "rdvCell", for: indexPath) as! rdvTableViewCell
            cell.labelCell.text = self.eventSet?.get(i: indexPath.row)?.getLabel()
            return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //var cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        let myVC = storyboard.instantiateViewController(withIdentifier: "detailRdv") as! DetailRdvViewController
        myVC.rdv = eventSet?.get(i: indexPath.row) as? RdvModel
        navigationController?.pushViewController(myVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            eventSet?.delete(eventToDelete: (eventSet?.get(i: indexPath.row)!)!)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}


