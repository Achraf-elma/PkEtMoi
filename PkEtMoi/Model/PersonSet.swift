//
//  PersonSet.swift
//  TP01-Personne
//
//  Created by Fiorio Christophe on 10/02/2018.
//  Copyright © 2018 Christophe Fiorio. All rights reserved.
//

import Foundation

/// Set of `Person`s
///
/// *add*: `PersonSet` x `Person` -> `PersonSet` -- add a `Person` to the collection
///
/// *remove*: `PersonSet` x `Person` -> `PersonSet` -- remove a `Person` to the collection
///
/// *count*: `PersonSet` -> `Int` -- number of `Person` in the collection
///
/// *contains:person*: `PersonSet` x `Person` -> `Bool` -- `true` if this `Person` belongs to collection
///
/// *look:forPersons*: `PersonSet` x `Person` -> `PersonSet` -- return a new `PersonSet` with all `Person` with same first name and last name of initial `PersonSet`
///
/// *contains:personWithFirstname*: `PersonSet` x `String` -> `Bool` -- `true` if this a `Person` with the same first name belongs to collection
///
/// *look:forPersonsWithFirstname*: `PersonSet` x `String` -> `PersonSet` -- return a new `PersonSet` with all `Person` with first name given in parameter
///
/// *contains:personWithLastname*: `PersonSet` x `String` -> `Bool` -- `true` if this a `Person` with the same lastname name belongs to collection
///
/// *look:forPersonsWithLastname*: `PersonSet` x `String` -> `PersonSet` -- return a new `PersonSet` with all `Person` with last name given in parameter
///
/// *contains:personWithFullname*: `PersonSet` x `String` -> `Bool` -- `true` if this a `Person` with the same full name belongs to collection
///
/// *look:forPersonsWithFullname*: `PersonSet` x `String` -> `PersonSet` -- return a new `PersonSet` with all `Person` with full name given in parameter
///
/// *makeIterator*: returns an iterator on collection
///
class PersonSet : Sequence{
   fileprivate var pset : [Person] = []
   
  /// `PersonSet` x `Person` -> `PersonSet` -- add Person to PersonSet, if `Person` already belongs to `PersonSet` then do nothing
  ///
  /// - Parameter person: `Person` to be added to the set
  /// - Returns: `PersonSet` with new `Person` added to the set, or `PersonSet` unmodified if `Person` belonged already to the set.
  @discardableResult
   func add(person: Person) -> PersonSet{
      if !self.contains(person: person){
         self.pset.append(person)
      }
      return self
   }
   

   /// `PersonSet` x `Person` -> `PersonSet` -- if `Person` belongs to `PersonSet`, remove it from the set, else do nothing
   ///
   /// - Parameter person: `Person` to be removed
   /// - Returns: `PersonSet` with `Person` removed if `Person` belonged to `PersonSet`
   @discardableResult
   func remove(person: Person) -> PersonSet{
      if let i = self.pset.index(of: person){
         self.pset.remove(at: i)
      }
      return self
   }
   
   /// number of elements in the set
   var count: Int{
      return self.pset.count
   }
   
   /// `PersonSet` x `Person` -> `Bool` -- look for `Person` in the set...
   ///
   /// - Parameter person: `Person` to be looked for
   /// - Returns: True if `Person` belongs to the set
   func contains(person: Person) -> Bool{
      return self.pset.contains(where: {$0===person})
   }
   
   /// `PersonSet` x `Person` -> `PersonSet` --
   ///  looks for `Person` with same firstname, lastname and returns a Set of all these persons
   ///
   /// - Parameter person: `Person` to be looked for
   /// - Returns: PersonSet will all `Person` conforming to parameter
   func look(forPersons person: Person) -> PersonSet{
      let ret : PersonSet = PersonSet()
      for p in self{
         if( (p.firstname == person.firstname) && (p.lastname == person.lastname) ){
            ret.add(person: p)
         }
      }
      return ret
   }
   
   /// PersonSet` x `String` -> `Bool` -- look for `Person` with firstname
   ///
   /// - Parameter firstname: `String` firstname to be search
   /// - Returns: True if at least one `Person` has this firstname
   func contains(personWithFirstname firstname: String) -> Bool{
      return self.pset.contains(where: {$0.firstname==firstname})
   }
   
   /// `PersonSet` x `Person` -> `PersonSet` --
   ///  looks for `Person` with a particular firstname returns a Set of all these persons
   ///
   /// - Parameter firstname: `String` firstname to be looked for
   /// - Returns: PersonSet will all `Person` with first name given in parameter
   func look(forPersonsWithFirstname firstname: String) -> PersonSet{
      let ret : PersonSet = PersonSet()
      for p in self{
         if( p.firstname == firstname ){
            ret.add(person: p)
         }
      }
      return ret
   }
   
   /// PersonSet` x `String` -> `Bool` -- look for `Person` with lastname
   ///
   /// - Parameter lastname: `String` lastname to be search
   /// - Returns: True if at least one `Person` has this lastname
   func contains(personWithLastname lastname: String) -> Bool{
      return self.pset.contains(where: {$0.lastname==lastname})
   }

   /// `PersonSet` x `Person` -> `PersonSet` --
   ///  looks for `Person` with a particular last name returns a Set of all these persons
   ///
   /// - Parameter lastname: `String` last name to be looked for
   /// - Returns: PersonSet will all `Person` with last name given in parameter
   func look(forPersonsWithLastname lastname: String) -> PersonSet{
      let ret : PersonSet = PersonSet()
      for p in self{
         if( p.lastname == lastname ){
            ret.add(person: p)
         }
      }
      return ret
   }
   
   /// PersonSet` x `String` -> `Bool` -- look for `Person` with lastname
   ///
   /// - Parameter fullname: `String` fullname to be search
   /// - Returns: True if at least one `Person` has this fullname
   func contains(personWithFullname fullname: String) -> Bool{
      return self.pset.contains(where: {$0.fullname==fullname})
   }

   /// `PersonSet` x `Person` -> `PersonSet` --
   ///  looks for `Person` with a particular full name returns a Set of all these persons
   ///
   /// - Parameter fullname: `String` full name to be looked for
   /// - Returns: PersonSet will all `Person` with full name given in parameter
   func look(forPersonsWithFullname fullname: String) -> PersonSet{
      let ret : PersonSet = PersonSet()
      for p in self{
         if( p.fullname == fullname ){
            ret.add(person: p)
         }
      }
      return ret
   }
   
   subscript(index: Int) -> Person {
      get {
         guard (index>=0) && (index<self.count) else{
            fatalError("index out of range")
         }
         return self.pset[index]
      }
      set(newValue) {
         guard (index>=0) && (index<self.count) else{
            fatalError("index out of range")
         }
         self.pset[index]=newValue
      }
   }
   
   /// `PersonSet` -> `ItPersonSet` -- make an iterator on the set
   ///
   /// - Returns: a new iterator on the set initialized on the first element
   func makeIterator() -> ItPersonSet{
      return ItPersonSet(self)
   }


}

// MARK: -

/// Iterator on PersonSet
struct ItPersonSet : IteratorProtocol{
   private var current: Int = 0
   private let set: PersonSet
   
   fileprivate init(_ s: PersonSet){
      self.set = s
   }
   
   /// reset iterator
   ///
   /// - Returns: iterator reseted
   @discardableResult
   mutating func reset() -> ItPersonSet{
      self.current = 0
      return self
   }
   
   @discardableResult
   mutating func next() -> Person? {
      guard self.current < self.set.count else{
         return nil
      }
      let nextPerson = self.set.pset[self.current]
      self.current += 1
      return nextPerson
   }

   /// true if iterator as finished
   var end : Bool{
      return self.current < self.set.count
   }
}

