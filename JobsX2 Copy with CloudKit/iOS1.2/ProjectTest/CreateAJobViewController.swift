//
//  CreateAJobViewController.swift
//  ProjectTest
//
//  Created by Stevie Dominique de Jaime Magaço on 4/13/16.
//  Copyright © 2016 Stevie Dominique de Jaime Magaço. All rights reserved.
//

import UIKit

class CreateAJobViewController: ViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //JobDescription Veiw
    @IBOutlet weak var JobTitle: UITextField!
    @IBOutlet weak var JobDescription: UITextField!
    @IBOutlet weak var Payment: UITextField!
    //Location View
    @IBOutlet weak var Street: UITextField!
    @IBOutlet weak var City: UITextField!
    @IBOutlet weak var State: UIPickerView!
    //Start Date
    @IBOutlet weak var StartDate: UIDatePicker!
    //Custom variables
    var OnJobdescription: Bool = false
    var OnLocation: Bool = false
    var OnStartDate: Bool = false
    @IBAction func SubmitbuttonPress(sender: AnyObject) {
        if UserData.JobHolder.JobTitle != "Default" && UserData.JobHolder.JobDescription != "Default" && UserData.JobHolder.Payment != "Default" && UserData.JobHolder.Street != "Default" && UserData.JobHolder.City != "Default" && UserData.JobHolder.State != "Default"{
            UserData.PostedJobs.append(UserData.JobHolder)
            print("job posting = \(UserData.PostedJobs.count)")
        let alert: UIAlertController = UIAlertController(title: "Job Posting", message: "Job was Successfully posted", preferredStyle: .Alert)
        let action: UIAlertAction = UIAlertAction(title: "Complete", style: .Default) { (a: UIAlertAction) -> Void in

            self.performSegueWithIdentifier("WelcomeSegue", sender: nil)//this function calls the segue to the homescreen
            //print("item Selected")
            
            }
        
        alert.addAction(action)
        self.presentViewController(alert, animated: true) { 
            () -> Void in
            print("alert presented")//can also leave the last section empty with a nil
        }
        }else{
            let alert: UIAlertController = UIAlertController(title: "Job Posting", message: "Not All arreas were filled out!", preferredStyle: .Alert)
            let action: UIAlertAction = UIAlertAction(title: "Return", style: .Default) { (a: UIAlertAction) -> Void in
                //self.performSegueWithIdentifier("WelcomeSegue", sender: nil)//this function calls the segue to the homescreen
                //print("item Selected")
                
            }
            
            alert.addAction(action)
            self.presentViewController(alert, animated: true) {
                () -> Void in
                print("alert presented")//can also leave the last section empty with a nil
            } 
        }
        
    }

    let usStates: [String] = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Lousiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dekota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dekota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.tabBarController?.tabBar.selectedItem?.title == "Job Description"{
           OnJobdescription = true
            OnLocation = false
            OnStartDate = false
        }else if self.tabBarController?.tabBar.selectedItem?.title == "Location"{
            OnJobdescription = false
            OnLocation = true
            OnStartDate = false

        }else if self.tabBarController?.tabBar.selectedItem?.title == "Start Date"{
            OnJobdescription = false
            OnLocation = false
            OnStartDate = true

        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return usStates.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return usStates[row]
    }
    func SaveInfo(){
       if OnJobdescription{
          if JobTitle.text != ""{
            UserData.JobHolder.JobTitle = JobTitle.text!
        }
        if JobDescription.text != ""{
            UserData.JobHolder.JobDescription = JobDescription.text!
        }
        if Payment.text != ""{
            UserData.JobHolder.Payment = Payment.text!
        }
        }
        if OnLocation{
         if Street.text != ""{
            UserData.JobHolder.Street = Street.text!
        }
        if City.text != ""{
            UserData.JobHolder.City = City.text!
        }
        //educations[SchoolInfo.selectedRowInComponent(0)]
        UserData.JobHolder.State = usStates[State.selectedRowInComponent(0)]
        }
        if OnStartDate{
        UserData.JobHolder.StartDate = StartDate!
        }

        
    }
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
