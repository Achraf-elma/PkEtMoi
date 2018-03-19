//
//  ViewController.swift
//  TP01-Personne
//
//  Created by Fiorio Christophe on 10/02/2018.
//  Copyright © 2018 Christophe Fiorio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   var tableViewController: PersonsTableViewController!
   
   @IBOutlet weak var tableView: UITableView!
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      self.tableViewController = PersonsTableViewController(tableView: self.tableView)
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   @IBAction func addAction(_ sender: Any) {
      let cf: Person
      
      let df = DateFormatter()
      df.dateFormat = "dd-mm-yyyy" 
      if let bdate = df.date(from: "01-06-1988"){
         cf = Person(firstname: "Christophe", lastname: "Fiorio", birthdate: bdate)
      }
      else{
         cf = Person(firstname: "Christophe", lastname: "Fiorio", birthdate: Date())
      }
      self.tableViewController.personsViewModel.add(person: cf)
      //self.tableView.reloadData()
   }
   
   
   @IBAction func updateAction(_ sender: Any) {
      guard let index = self.tableView.indexPathForSelectedRow else{
         return
      }
      self.tableViewController.personsViewModel.updateBirthDate(atIndexPath: index, withDate: Date())
   }
   
}

