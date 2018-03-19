//
//  PersonsTableViewController.swift
//  TP02-TableView
//
//  Created by Fiorio Christophe on 11/02/2018.
//  Copyright © 2018 Christophe Fiorio. All rights reserved.
//

import UIKit

//-------------------------------------------------------------------------------------------------
// MARK: -

protocol PersonPresenterProtocol {
   func text(ofPerson person:  Person) -> String
   func birthDate(ofPerson person: Person) -> String
}


//-------------------------------------------------------------------------------------------------
// MARK: -

class PersonsTableViewController: NSObject, UITableViewDataSource, PersonSetViewModelDelegate {
   
   var presenter   : PersonPresenter!
   var tableView   : UITableView!
   var personsViewModel : PersonSetViewModel!
   
   init(tableView: UITableView) {
      super.init()
      self.tableView = tableView
      self.tableView.dataSource = self
      self.presenter = PersonPresenter()
      self.personsViewModel = PersonSetViewModel()
      self.personsViewModel.delegate = self
   }
   
   //-------------------------------------------------------------------------------------------------
   // MARK: - TableView DataSource
   
   func numberOfSections(in tableView: UITableView) -> Int {
      // #warning Incomplete implementation, return the number of sections
      return 1
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      // #warning Incomplete implementation, return the number of rows
      return self.personsViewModel.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCellId", for: indexPath)
      
      // Configure the cell...
      return configure(cell: cell, atIndexPath: indexPath)
   }

   //-------------------------------------------------------------------------------------------------
   // MARK: - PersonSetViewModelDelegate
   func dataSetChanged(){
      self.tableView.reloadData()
   }
   func personChanged(at: IndexPath){
      self.tableView.beginUpdates()
      self.tableView.reloadRows(at: [at], with: UITableViewRowAnimation.fade)
      self.tableView.endUpdates()
   }
   func personAdded(at: IndexPath){
      self.tableView.beginUpdates()
      self.tableView.insertRows(at: [at], with: UITableViewRowAnimation.middle)
      self.tableView.endUpdates()
//      self.tableView.reloadData()
   }
   
   
   //-------------------------------------------------------------------------------------------------
   // MARK: - convenience methods

   @discardableResult
   private func configure(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell{
      cell.textLabel?.text = self.personsViewModel.displayPerson(at: indexPath)
      return cell
   }
   
}


