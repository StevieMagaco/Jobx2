//
//  DataSource.swift
//  ProjectTest
//
//  Created by Tom Alex on 4/15/16.
//  Copyright © 2016 Stevie Dominique de Jaime Magaço. All rights reserved.
//
import UIKit
import Foundation

var UserData: DataSource = DataSource(m_Name: "Tom Alex", m_Age: "\(18)", m_Education: "College", m_DOBText: "12/15/1994", m_Description: "Need people to mow my lown weekly", m_Gender: "Male",m_Email: "Tom_Alex@fullsail.edu", m_PhoneNumber: "(407)-555-5050",m_Password: "Password" )

struct DataSource{
    var PostedJobs: [JobsDescriptionData] = [JobsDescriptionData(m_JobTitle: "Default", m_JobDescription: "Default", m_Payment: "Default", m_Street: "Default", m_City: "Default", m_State: "Default")]
    var Name : String = "Tom Alex"
    var Age : String = "\(18)"
    var Gender : String = "Male"
    var Education: String = "Bachelors"
    var DOB: UIDatePicker? = nil
    var DOBText : String? = "12/15/1994"
    var Description : String
    var ProfilePic : UIImage? = nil
    var Email: String
    var PhoneNumber: String
    var Password: String
    // Hold a temp Job posting before adding it to the array
    var JobHolder: JobsDescriptionData = JobsDescriptionData(m_JobTitle: "Default", m_JobDescription: "Default", m_Payment: "Default", m_Street: "Default", m_City: "Default", m_State: "Default")
    //Error message for creat account
    var ErrorMessage: String = ""
    //This is for Creating Accounts 
    var Step1Data : Bool = false
    init(m_Name: String, m_Age: String, m_Education: String, m_DOBText: String, m_Description: String, m_Gender: String, m_Email: String, m_PhoneNumber: String, m_Password: String){
        Name = m_Name
        Age = m_Age
        Education = m_Education
        DOBText = m_DOBText
        Description = m_Description
        Gender = m_Gender
        Email = m_Email
        PhoneNumber = m_PhoneNumber
        Password = m_Password
    }
    mutating func EditData(m_Name: String, m_Age: String, m_Gender: String, m_Education: String, m_DOB: UIDatePicker?, m_Description: String, m_ProfilePic : UIImage?, m_DOBText: String?){
        Name = m_Name
        Age = m_Age
        Gender = m_Gender
        Education = m_Education
        DOB = m_DOB
        Description = m_Description
        ProfilePic = m_ProfilePic
        DOBText = m_DOBText
    }
        
}

struct JobsDescriptionData{
    var JobTitle: String
    var JobDescription: String
    var Payment: String
    var StartDate: UIDatePicker?
    var Street: String
    var City: String
    var State: String
    
    init(m_JobTitle: String, m_JobDescription: String, m_Payment: String, m_Street: String, m_City: String, m_State: String){
        JobTitle = m_JobTitle
        JobDescription = m_JobDescription
        Payment = m_Payment
        Street = m_Street
        City = m_City
        State = m_State
    }
   mutating func SetData(m_JobTitle: String, m_JobDescription: String, m_Payment: String, m_StartDate: UIDatePicker, m_Street: String, m_City: String, m_State: String){
        JobTitle = m_JobTitle
        JobDescription = m_JobDescription
        Payment = m_Payment
        StartDate = m_StartDate
        Street = m_Street
        City = m_City
        State = m_State
    }
}
