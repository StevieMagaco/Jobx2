//
//  ProfileViewController.swift
//  ProjectTest
//
//  Created by Tom Alex on 4/14/16.
//  Copyright © 2016 Stevie Dominique de Jaime Magaço. All rights reserved.
//
import UIKit
import Foundation



class ProfileView: UIViewController,UITextFieldDelegate {
    override func shouldAutorotate() -> Bool {
        return false
    }

    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var EditButton: UIButton!
    @IBOutlet weak var SaveButton: UIButton!
    @IBOutlet weak var DescriptionText: UITextView!
    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var AgeText: UITextField!
    @IBOutlet weak var EducationText: UITextField!
    //@IBOutlet weak var DOBText: UITextField!
    @IBOutlet weak var GenderText: UITextField!
    @IBOutlet weak var PhoneNumberText: UITextField!
    @IBOutlet weak var EmailText: UITextField!
    
    //DataSource
    //var ProfileData : DataSource = DataSource(m_Name: "Tom Alex", m_Age: 18, m_Education: "College", m_DOBText: "12/15/1994", m_Description: "Need people to mow my lown weekly", m_Gender: "Male")
       
       override func viewDidLoad() {
        self.AgeText.delegate = self
        //self.DescriptionText.delegate = self
        //self.DOBText.delegate = self
        self.EducationText.delegate = self
        self.GenderText.delegate = self
        self.NameText.delegate = self
        self.EmailText.delegate = self
        self.PhoneNumberText.delegate = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ProfileView.keyboardWillAppear(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ProfileView.keyboardWillDisappear(_:)), name: UIKeyboardWillHideNotification, object: nil)
        if(NameText.text == "")
        {
        DescriptionText.text = UserData.Description
        NameText.text = UserData.Name
        AgeText.text = "\(UserData.Age)"
        EducationText.text = UserData.Education
        //DOBText.text = UserData.DOBText
        GenderText.text = UserData.Gender
        PhoneNumberText.text = UserData.PhoneNumber
        EmailText.text = UserData.Email
        }
        TurnEditoff()
    }
    func keyboardWillAppear(notification: NSNotification){
       // ScrollView.contentSize = CGSizeMake(width, height);
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
        let Width = ScrollView.frame.size.width
        let Hight = ScrollView.frame.size.height
           self.ScrollView.contentSize = CGSizeMake(Width, Hight + (keyboardSize.height ))
            self.ScrollView.frame.size = CGSizeMake(Width, Hight - keyboardSize.height)
            self.ScrollView.scrollEnabled = true
        }
    }
    
    func keyboardWillDisappear(notification: NSNotification){
        // Do something here
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            let Width = ScrollView.frame.size.width
            let Hight = ScrollView.frame.size.height
            self.ScrollView.contentSize = CGSizeMake(Width, Hight - (keyboardSize.height))
           self.ScrollView.frame.size = CGSizeMake(Width, Hight + (keyboardSize.height))
        }

    }
        @IBAction func EditButtonClick(sender: AnyObject) {
       TurnEditOn()
    }
    @IBAction func SaveButtonClick(sender: AnyObject) {
        TurnEditoff()
       //let Ageint: String? = AgeText.text!
        UserData = DataSource(m_Name: "\(NameText.text!)", m_Age: "\(AgeText.text!)" , m_Education: "\(EducationText.text!)", m_DOBText: "Testing", m_Description: "\(DescriptionText.text!)", m_Gender: "\(GenderText.text!)", m_Email: "\(EmailText.text!)", m_PhoneNumber: "\(PhoneNumberText.text!)", m_Password: "\(UserData.Password)")
    }
    func textFieldShouldReturn(userText: UITextField) -> Bool {
        userText.resignFirstResponder()
        return true
    }
    func TurnEditoff() {
        EditButton.enabled = true
        SaveButton.enabled = false
        DescriptionText.editable = false
        NameText.enabled = false
        AgeText.enabled = false
        EducationText.enabled = false
        //DOBText.enabled = false
        GenderText.enabled = false
        PhoneNumberText.enabled = false
        EmailText.enabled = false
    }
    func TurnEditOn(){
        EditButton.enabled = false
        SaveButton.enabled = true
        DescriptionText.editable = true
        NameText.enabled = true
        AgeText.enabled = true
        EducationText.enabled = true
        //DOBText.enabled = true
        GenderText.enabled = true
        PhoneNumberText.enabled = true
        EmailText.enabled = true
    }
    
}