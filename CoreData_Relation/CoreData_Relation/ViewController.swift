//
//  ViewController.swift
//  CoreData_Relation
//
//  Created by TestMac on 30/10/18.
//  Copyright © 2018 TestMac. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var appDelegate_:  AppDelegate!
    var context_: NSManagedObjectContext!
    var entity_: NSEntityDescription!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        appDelegate_ = UIApplication.shared.delegate as! AppDelegate
        context_ = appDelegate_.persistentContainer.viewContext
        //entity_ = NSEntityDescription.entity(forEntityName: "Users", in: context_)
        //let users_ = NSManagedObject(entity: entity_!, insertInto: context_)
        
       //deleteUserObjects(obj_: users_, context: context_)
      //  setValuesToUserEntity(obj_: users_, context: context_)
      oneToMany_()
    }
    
    func setValuesToUserEntity(obj_: NSManagedObject, context: NSManagedObjectContext) {
        let obj_1 = NSManagedObject(entity: entity_!, insertInto: context_)
        obj_1.setValue("jk", forKey: "username")
        obj_1.setValue("Test@123", forKey: "password")
        obj_1.setValue("25", forKey: "age")
        saveContext(context: context)
        
        
    }
    
    func deleteUserObjects(obj_: NSManagedObject, context: NSManagedObjectContext) {
    
        let fetReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        fetReq.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(fetReq)
            for item in result as! [NSManagedObject]{
                context.delete(item)
            }
        }catch{
            
        }
        saveContext(context: context)
        
        setValuesToUserEntity(obj_: obj_, context: context)
    }

    func saveContext(context: NSManagedObjectContext) {
        do{
            try context.save()
        }catch{
            print("error in saving")
        }
        fetchCoreDataEntities(context: context)
    }
    
    func fetchCoreDataEntities(context: NSManagedObjectContext) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            for item in result as! [NSManagedObject]{
                print("item:- \(item)")
            }
        }catch{
            print("fetch Fails")
        }
    }
    
    
    func oneToMany_() {
        let person_ = Persons(context: context_)
        person_.name = "jk_cs"
        
        let friend_ = Friends(context: context_)
        friend_.firstname = "th"
        friend_.lastname = "n"
        
        let friend_1 = Friends(context: context_)
        friend_1.firstname = "jagan"
        friend_1.lastname = "YS"
        
        let phone_ = Phone(context: context_)
        phone_.model="iphone"
        phone_.number = "9966332255"
        
        let phone_1 = Phone(context: context_)
        phone_1.model="samsung"
        phone_1.number = "9999332255"
        
        person_.addToFriend(friend_)
       // person_.addToFriend(friend_1)
        
        person_.phone = phone_
        person_.phone = phone_1
        phone_.person = person_
        //friend_1.addToPerson(person_)
        //phone_.person = person_
        
        print("person:- \(person_)")
        print("friends:- \(friend_1)")
        print("friends1:- \(friend_)")
        print("phone_:- \(phone_)")
        print("phone_1:- \(phone_1)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

