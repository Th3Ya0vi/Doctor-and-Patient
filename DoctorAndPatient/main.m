//
//  main.m
//  DoctorAndPatient
//
//  Created by Narendra Thapa on 2016-01-14.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Doctor.h"
#import "Patient.h"
#import "Database.h"

int main(int argc, const char * argv[]) {
    
    InputCollector *userInput = [[InputCollector alloc] init];
    Database *doctorDB = [[Database alloc] init];
    Database *patientDB = [[Database alloc] init];
    
    NSString *usersOption = @"beginning";
    
    while (![usersOption isEqualToString:@"quit"]) {
    
        usersOption = [userInput inputForPrompt:@"Are you a doctor or patient (doctor/patient)? or type quit"];
        
    if ([usersOption isEqualToString:@"doctor"]) {
        
        usersOption = @"startingDoctor";

        while (![usersOption isEqualToString:@"exit"]) {
        
        usersOption = [userInput inputForPrompt:@"\nAdd new doctor record - adddoc\nAdd new patient - addpat\nView Patients- viewpat\nView Doctors - viewdoc\nExit - exit\n"];
            
            if ([usersOption isEqualToString:@"adddoc"]) {
        NSString *doctorsName = [userInput inputForPrompt:@"Enter Doctor's Name"];
        NSString *doctorsSpecialization = [userInput inputForPrompt:@"Enter Doctor's Specialization"];
        
        //doctor.doctorSerialNumber = 0;
        
        Doctor *doctor = [[Doctor alloc] initWithDoctorName:doctorsName andSpecialization:doctorsSpecialization];
        
                [doctorDB addDoctorsToArray:doctor];
            }
            else if ([usersOption isEqualToString:@"viewdoc"])
            {
                [doctorDB displayDoctorsArray];
            }
            else if ([usersOption isEqualToString:@"viewpat"])
            {
                [patientDB displayPatientsArray];
            }
            else if ([usersOption isEqualToString:@"addpat"])
            {
                NSString *patientsName = [userInput inputForPrompt:@"Enter Patient's Name"];
                NSString *patientsAgeString = [userInput inputForPrompt:@"Enter Patient's Age"];
                NSUInteger patientsAge = [patientsAgeString intValue];
                
                NSString *patientsHealthCard = [userInput inputForPrompt:@"Do you have a health card (YES/NO)?"];
                
                BOOL patientHC;
                
                if ([patientsHealthCard isEqualToString:@"YES"] || [patientsHealthCard isEqualToString:@"yes"]) {
                    patientHC = YES;
                }
                else {
                    patientHC = NO;
                }
                
                Patient *patient = [[Patient alloc] initWithPatientName:patientsName andAge:patientsAge andHealthCard:patientHC];
                
                [patientDB addPatientsToArray:patient];

            }
        }
    } else if ([usersOption isEqualToString:@"patient"]) {
        
        usersOption = @"startingPatient";
        
        while (![usersOption isEqualToString:@"exit"]) {
            
            usersOption = [userInput inputForPrompt:@"\nView Doctors- viewdoc\nView Patients - select\nView Request - status\nExit - exit\n"];
            
            if ([usersOption isEqualToString:@"viewdoc"])
            {
                [doctorDB displayDoctorsArray];
                
            }
            else if ([usersOption isEqualToString:@"select"])
            {
                //NSString *selectDoc = [userInput inputForPrompt:@"Enter Doctor Index"];
                //NSUInteger indexDoc = [selectDoc intValue];
                
                // call method to get accepted
                [patientDB displayPatientsArray];
                NSString *selectPat = [userInput inputForPrompt:@"Enter Patient Index"];
                NSUInteger indexPat = [selectPat intValue];
                
                [patientDB canPatientBeAccepted:indexPat];
                
                [patientDB displayPatientsArray];
                
                // need this to ask user for index and pick a doc
                //[patientDB displayPatientsArray];
            }
        }
    } else {
        NSLog(@"Invalid Option");
    }
    
    }       // while loop end
    
    NSLog(@"Thanks!! Come back again");
    
    
    return 0;
}
