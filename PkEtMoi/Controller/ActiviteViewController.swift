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
    
    @IBOutlet weak var ajoutEtatOutlet: UIBarButtonItem!
    @IBAction func ajoutEtat(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let myVC = storyboard.instantiateViewController(withIdentifier: "etat") as! EtatViewController
        navigationController?.pushViewController(myVC, animated: true)
    }
    @IBOutlet weak var activiteTable: UITableView!

    
    @IBAction func ajoutActivite(_ sender: UIButton) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "ajoutActivite") as! AjoutActiviteViewController
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !(AbstractDAO.getDAO()?._getSyntheseDAO()?._shouldSyntheseBeFilled())! {
            ajoutEtatOutlet.isEnabled = false
        }
        else{
            ajoutEtatOutlet.isEnabled = true
        }
        self.eventSet = EventSet(activiteSet:(AbstractDAO.getDAO()?._getActiviteDAO()?._getAll())!)
        activiteTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !(AbstractDAO.getDAO()?._getSyntheseDAO()?._shouldSyntheseBeFilled())! {
            ajoutEtatOutlet.isEnabled = false
        }
        else{
            ajoutEtatOutlet.isEnabled = true
        }
        self.eventSet = EventSet(activiteSet:(AbstractDAO.getDAO()?._getActiviteDAO()?._getAll())!)
        activiteTable?.delegate = self
        activiteTable?.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventSet!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = self.activiteTable?.dequeueReusableCell(withIdentifier: "activiteCell", for: indexPath) as! ActiviteTableViewCell
            cell.labelCell.text = self.eventSet?.get(i: indexPath.row)?.getLabel()
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //var cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                  let myVC = storyboard.instantiateViewController(withIdentifier: "detailActivite") as! DetailActiviteViewController
        myVC.activite = eventSet?.get(i: indexPath.row) as? ActiviteModel
            navigationController?.pushViewController(myVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            eventSet?.delete(eventToDelete: (eventSet?.get(i: indexPath.row)!)!)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}


