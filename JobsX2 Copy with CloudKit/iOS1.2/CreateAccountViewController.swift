//
//  CreateAccountViewController.swift
//  ProjectTest
//
//  Created by Stevie Dominique de Jaime Magaço on 4/15/16.
//  Copyright © 2016 Stevie Dominique de Jaime Magaço. All rights reserved.
//

import UIKit
import CloudKit

class CreateAccountViewController: ViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let educations: [String] = ["Elementary School", "Middle School", "High School", "College", "Graduate"]
    @IBOutlet weak var ageViewer: UILabel!
    @IBOutlet weak var userAge: UIStepper!
    @IBOutlet weak var phoneNumberTextinput: UITextField!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var About: UITextView!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ConfirmPassword: UITextField!
    @IBOutlet weak var Sex: UISegmentedControl!
    var Step1: Bool = false
    var Step2: Bool = false
    @IBOutlet weak var SchoolInfo: UIPickerView!
    //var Step1Data : Bool = false
    //sends the value of the age stepper to the label
    @IBAction func changeAgeButton(sender: AnyObject) {
        ageViewer.text = "\(Int(userAge.value))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //SubmitButton.enabled = false
        // Do any additional setup after loading the view.
        //Pick witch page to save info from 
        if self.tabBarController?.tabBar.selectedItem?.title == "Step 1"{
            Step1 = true
            Step2 = false
        }else if self.tabBarController?.tabBar.selectedItem?.title == "Step 2"{
            Step1 = false
            Step2 = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return educations.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return educations[row]
    }
    
    //Check data filled step2
    func CheckStep2() -> Bool{
        var numbererrors: Int = 0
        if About.text == ""{
            UserData.ErrorMessage +=  "About is empty!"
           numbererrors += 1
        }
        if Password.text == ""{
            UserData.ErrorMessage += "Passowrd is empty!"
            numbererrors += 1
        }
        if ConfirmPassword.text == ""{
            UserData.ErrorMessage += "ConfirmPassword is empty! "
            numbererrors += 1
        }
        if Password.text != ConfirmPassword.text{
            UserData.ErrorMessage += "Passwords do not match! "
            numbererrors += 1
        }
        if numbererrors != 0{
            return false
        }
        return true
    }
    //Check data filled Step1 page
    func CheckStep1() -> Bool{
        var numbererrors: Int = 0
        if FirstName.text == ""{
            UserData.ErrorMessage += "First name is empty! "
            numbererrors += 1}
        if LastName.text == ""{
            UserData.ErrorMessage += "Last name is empty! "
            numbererrors += 1}
        if Email.text == "" || Email.text?.containsString(".com") == false && Email.text?.containsString("@") == false{
            UserData.ErrorMessage += "Email is empty or doesn't contain @example.com! "
            numbererrors += 1}
        if phoneNumberTextinput.text == ""{
            UserData.ErrorMessage +=  "Phone Number is empty! "
            numbererrors += 1}
        if numbererrors != 0{
            return false
        }
        
        return true
    }
    
    //Submit Button
    @IBAction func SubmitButtonAction(sender: AnyObject) {
        //print("\(Step1Data)")
        if UserData.Step1Data && CheckStep2(){
           
            //Add here function to push to server
            let greatID = CKRecordID(recordName: UserData.Email)
            let newAccount = CKRecord(recordType: "User", recordID: greatID)
            newAccount["Name"] = UserData.Name
            newAccount["Age"] = UserData.Age
            newAccount["Sex"] = Sex.titleForSegmentAtIndex(Sex.selectedSegmentIndex)
            newAccount["About"] = About.text
            newAccount["Email"] = UserData.Email
            newAccount["Education"] = UserData.Education
            newAccount["Password"] = Password.text
            newAccount["PhoneNumber"] = UserData.PhoneNumber
            
            let publicData = CKContainer.defaultContainer().publicCloudDatabase
            publicData.saveRecord(newAccount, completionHandler: { (record: CKRecord?, error: NSError?) in
                if error == nil { self.performSegueWithIdentifier("SubnmitNewAccount", sender: nil)}
                else {print(error)}
            })
            
            
            
            
        }else {
            CheckStep2()
            let alert: UIAlertController = UIAlertController(title: "Error!", message: UserData.ErrorMessage, preferredStyle: .Alert)
            let action: UIAlertAction = UIAlertAction(title: "Return", style: .Default) { (a: UIAlertAction) -> Void in
                print("Button pressed")}
            
            alert.addAction(action)
            self.presentViewController(alert, animated: true) {
                () -> Void in
                print("alert presented")//can also leave the last section empty with a nil
                UserData.ErrorMessage = ""
            }
        }
    }
    
      //Save info to UserData
    func SaveInfo(){
        if Step1{
            if FirstName.text != "" && LastName.text != ""{
           UserData.Name = ( FirstName.text! + " " + LastName.text!)
            }
            if Email.text != ""{
                UserData.Email = Email.text!
            }
            if phoneNumberTextinput.text != ""{
                UserData.PhoneNumber = phoneNumberTextinput.text!
            }
            UserData.Age = ageViewer.text!
            
            if CheckStep1(){
                UserData.Step1Data = true
            }else {
                UserData.Step1Data = false
            }
        }
        if Step2{
           if About.text != ""{
            UserData.Description = About.text!
           }
            UserData.Gender = Sex.titleForSegmentAtIndex(Sex.selectedSegmentIndex)!
            if Password.text != "" && ConfirmPassword.text != ""{
            if Password.text == ConfirmPassword.text{
                UserData.Password = Password.text!
            }
                UserData.Education = educations[SchoolInfo.selectedRowInComponent(0)]
                print(educations[SchoolInfo.selectedRowInComponent(0)])
            }
        }
    }
    //Save data when page closes
    override func viewWillDisappear(animated:Bool){
        SaveInfo()
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
