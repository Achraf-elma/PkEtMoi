//
//  ResumeControllerViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit
import CoreData

class AncienSyntheseViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    var synthese : SyntheseSet? = nil
    
    
    @IBOutlet weak var syntheseTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        synthese = AbstractDAO.getDAO()?._getSyntheseDAO()?._getAll()
        syntheseTable?.delegate = self
        syntheseTable?.dataSource = self
        syntheseTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.synthese!.count)
        return self.synthese!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.syntheseTable?.dequeueReusableCell(withIdentifier: "ancienSynthese", for: indexPath) as! AncienSyntheseTableViewCell
        let dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy HH:mm"
        cell.labelAncien.text = dateFormatter.string(from:(synthese?.get(i: indexPath.row)?.rdv.date)!)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //var cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let myVC = storyboard.instantiateViewController(withIdentifier: "detailSynthese") as! DetailSyntheseViewController
        myVC.synthese = synthese?.get(i: indexPath.row) as? SyntheseModel
        navigationController?.pushViewController(myVC, animated: true)
    }
    
}




