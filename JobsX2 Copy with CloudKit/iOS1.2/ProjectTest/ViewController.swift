//
//  ViewController.swift
//  ProjectTest
//
//  Created by Stevie Dominique de Jaime Magaço on 4/11/16.
//  Copyright © 2016 Stevie Dominique de Jaime Magaço. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController, UITextFieldDelegate {
    //Variables to check the states of the objects on the Main.storyboard

   
    @IBOutlet weak var ScrollView: UIScrollView!
    



    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ProfileView.keyboardWillAppear(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ProfileView.keyboardWillDisappear(_:)), name: UIKeyboardWillHideNotification, object: nil)
        if (EmailTextin != nil){
         self.EmailTextin.delegate = self
        }
        if PasswordTextin != nil{
        self.PasswordTextin.delegate = self
        }*/

        // Do any additional setup after loading the view, typically from a nib
        
    }
    
    /*func keyboardWillAppear(notification: NSNotification){
        // ScrollView.contentSize = CGSizeMake(width, height);
        if ScrollView != nil{
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            let Width = ScrollView.frame.size.width
            let Hight = ScrollView.frame.size.height
            self.ScrollView.contentSize = CGSizeMake(Width, Hight + (keyboardSize.height ))
            self.ScrollView.frame.size = CGSizeMake(Width, Hight - keyboardSize.height)
            self.ScrollView.scrollEnabled = true
        }
        }
    }
    
    func keyboardWillDisappear(notification: NSNotification){
        // Do something here
        if ScrollView != nil{
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            let Width = ScrollView.frame.size.width
            let Hight = ScrollView.frame.size.height
            self.ScrollView.contentSize = CGSizeMake(Width, Hight - (keyboardSize.height))
            self.ScrollView.frame.size = CGSizeMake(Width, Hight + (keyboardSize.height))
        }
        }
    }
    func textFieldShouldReturn(userText: UITextField) -> Bool {
        userText.resignFirstResponder()
        return true
    }*/
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        

    }
    

    
    func popupMessage(mainMessage: String, messageTitle: String)
    {
        /*
        
        let alert: UIAlertController = UIAlertController(title: messageTitle, message: mainMessage, preferredStyle: .Alert)
        let action: UIAlertAction = UIAlertAction(title: "Return", style: .Default) { (a: UIAlertAction) -> Void in
            print("Button pressed")}
        
        alert.addAction(action)
        self.presentViewController(alert, animated: true) {
            () -> Void in
            print("alert presented")//can also leave the last section empty with a nil
          */

    
    //}


    }
}

