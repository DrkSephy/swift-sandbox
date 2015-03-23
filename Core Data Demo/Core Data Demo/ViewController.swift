//
//  ViewController.swift
//  Core Data Demo
//
//  Created by David Leonard on 3/22/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
        // Context provides a framework for accessing Core Data
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        // An Entity is a table
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject;
        
        // Create a new instance in the database
        newUser.setValue("David", forKey: "username")
        newUser.setValue("pass", forKey: "password");
        context.save(nil);
        
        // Fetch data from our Users table
        var request = NSFetchRequest(entityName: "Users");
        request.returnsObjectsAsFaults = false;
        
        var results = context.executeFetchRequest(request, error: nil);
        
        if results?.count > 0 {
            for result: AnyObject in results! {
                println(result);
            }
        } else {
            println("No results");
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
