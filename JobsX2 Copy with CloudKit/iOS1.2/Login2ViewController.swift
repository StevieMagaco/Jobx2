//
//  Login2ViewController.swift
//  ProjectTest
//
//  Created by Stevie Dominique de Jaime Magaço on 5/1/16.
//  Copyright © 2016 Stevie Dominique de Jaime Magaço. All rights reserved.
//

import UIKit
import CloudKit

class Login2ViewController: ViewController {

    
    @IBOutlet weak var EmailTextin: UITextField!
    @IBOutlet weak var PasswordTextin: UITextField!
    @IBOutlet weak var TurnOnShowPasswordSwitchState: UISwitch!
    
    
    @IBAction func LoginButtonPress(sender: AnyObject) {
        
        if(EmailTextin.text?.containsString(".com") == true && EmailTextin.text?.containsString("@") == true && PasswordTextin.text?.isEmpty == false)
        {
            if checkUserInServer(EmailTextin.text!, password: PasswordTextin.text!) == true {
                performSegueWithIdentifier("GoToIntroscreen", sender: nil)}
        }
        else
        {
            let alert: UIAlertController = UIAlertController(title: "Caution!", message: "Please fill the Email and Password boxes with the correct information", preferredStyle: .Alert)
            let action: UIAlertAction = UIAlertAction(title: "Return", style: .Default) { (a: UIAlertAction) -> Void in
                print("Button pressed")}
            
            alert.addAction(action)
            self.presentViewController(alert, animated: true) {
                () -> Void in
                print("alert presented")//can also leave the last section empty with a nil
                
            }
        }
    }
    
    //Checks for the state of the ShowPassword switch and changes how the Password field is updated
    @IBAction func TurnOnShowPassword(sender: AnyObject) {
        if(TurnOnShowPasswordSwitchState.on == true)
        {
            PasswordTextin.secureTextEntry = false
        }
        else
        {PasswordTextin.secureTextEntry = true}
    }
    
    func checkUserInServer(email: String, password: String) -> Bool
    {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        spinner.tintColor = UIColor.blackColor()
        spinner.startAnimating()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: spinner)
        
        
        var pass1: Bool = false
        var pass2: Bool = false
        let recordID = CKRecordID(recordName: email)
        var user = [CKRecord]()
        
        let publicData = CKContainer.defaultContainer().publicCloudDatabase
        
        publicData.fetchRecordWithID(recordID, completionHandler: { (record: CKRecord?, error: NSError?) -> Void in if error == nil { if let rec = record { user.append(rec); pass1 = true}
        } else {print(error)}
        })
        
        /*//looking is server for user
         let query = CKQuery(recordType: "User", predicate:  NSPredicate(format: "Email = %@", myemail))
         
         publicData.performQuery(query, inZoneWithID: nil) { (results:[CKRecord]?, error:NSError?) in if (error != nil)
         {self.users = results!
         pass1 = true } else {print(error)}
         
         }*/
        
        return pass2
        
    }
    
    //turns off the keyboard after editing any text field
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
