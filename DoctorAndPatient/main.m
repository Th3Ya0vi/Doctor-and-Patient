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
    
        // Initializing the objects for user in the program
        InputCollector *userInput = [[InputCollector alloc] init];
        Database *doctorDB = [[Database alloc] init];
        Database *patientDB = [[Database alloc] init];
    
        // Initializing the userinput variable with non-quit string
        NSString *usersOption = @"beginning";
    
    while (![usersOption isEqualToString:@"quit"]) {
    
        // Requesting user for input option
        usersOption = [userInput inputForPrompt:@"Are you a doctor or patient (doctor/patient)? or type quit"];
        
    if ([usersOption isEqualToString:@"doctor"]) {
        
        // Initializing the userinput variable with non-exit string
        usersOption = @"startingDoctor";

        while (![usersOption isEqualToString:@"exit"]) {
        
            // Requesting user for input option
            usersOption = [userInput inputForPrompt:@"\nAdd new doctor record - adddoc\nAdd new patient record - addpat\nView Patients- viewpat\nView Doctors - viewdoc\nTreat a patient - treat\nExit - exit\n"];
            
            if ([usersOption isEqualToString:@"adddoc"])                // Add a new doctor record
            {
                NSString *doctorsName = [userInput inputForPrompt:@"Enter Doctor's Name"];
                NSString *doctorsSpecialization = [userInput inputForPrompt:@"Enter Doctor's Specialization"];
                
                // Initializing an object of doctor with input name and specialization
                Doctor *doctor = [[Doctor alloc] initWithDoctorName:doctorsName andSpecialization:doctorsSpecialization];
                
                // Add object of doctor to doctor array
                [doctorDB addDoctorsToArray:doctor];
            }
            else if ([usersOption isEqualToString:@"viewdoc"])          // View the doctor details from doctor array
            {
                [doctorDB displayDoctorsArray];
            }
            else if ([usersOption isEqualToString:@"viewpat"])          // View the patient details from patient array
            {
                [patientDB displayPatientsArray];
            }
            else if ([usersOption isEqualToString:@"addpat"])           // Add a new patient record
            {
                NSString *patientsName = [userInput inputForPrompt:@"Enter Patient's Name"];
                NSString *patientsAgeString = [userInput inputForPrompt:@"Enter Patient's Age"];
                NSUInteger patientsAge = [patientsAgeString intValue];
                NSString *patientsHealthCard = [userInput inputForPrompt:@"Do you have a health card (YES/NO)?"];
                
                BOOL patientHC;
                if ([patientsHealthCard isEqualToString:@"YES"] || [patientsHealthCard isEqualToString:@"yes"]) {   // Checking patient's HealthCard input string
                    patientHC = YES;
                }   else {
                    patientHC = NO;
                }
                
                // Initializing an object of patient with input name, age and healthcard
                Patient *patient = [[Patient alloc] initWithPatientName:patientsName andAge:patientsAge andHealthCard:patientHC];
                
                // Add object of patient to patient array
                [patientDB addPatientsToArray:patient];
            }
            else if ([usersOption isEqualToString:@"treat"])                                // Treat a patient if appointment request is present
            {
                // Display doctor list to identify which doctor has open requests
                [doctorDB displayDoctorsArray];
                NSString *selectDocByDoc = [userInput inputForPrompt:@"Enter Doctor Index"];
                NSUInteger indexTypeShouldNotBeStringDoc = [doctorDB indexValueShouldNotbeString:selectDocByDoc];       // Checking index entered is not non-numeric
                
                if (indexTypeShouldNotBeStringDoc == 0) {
                NSUInteger indexDocByDoc = [selectDocByDoc intValue];
                NSUInteger validDocIndex = [doctorDB checkIndexInArrayRangeDoctors:indexDocByDoc];      // Checking index entered is not out-of-range of array
                
                if (validDocIndex == 1) {
                NSUInteger doesDocHasRequests = [doctorDB verifyDocHasRequests:indexDocByDoc];          // Verify doctor has received requests

                if (doesDocHasRequests == 1) {
                    
                    // check patient index before writing prescription
                    [patientDB displayPatientsArray];
                    NSString *selectPatByDoc = [userInput inputForPrompt:@"Enter Patient Index"];
                    NSUInteger indexTypeShouldNotBeStringPat = [doctorDB indexValueShouldNotbeString:selectPatByDoc];   // Checking index entered is not non-numeric
                    
                    if (indexTypeShouldNotBeStringPat == 0) {
                    
                    NSUInteger indexPatByDoc = [selectPatByDoc intValue];
                    
                    NSUInteger validPatientIndex = [patientDB checkIndexInArrayRangePatients:indexPatByDoc];  // Checking index entered is not out-of-range of array
                    
                    if (validPatientIndex == 1) {
                    
                    NSUInteger patientHasRaisedRequest = [patientDB verifyPatientHasRaisedRequests:indexPatByDoc]; // Checking patient request number is > 0
                    
                    if (patientHasRaisedRequest == 1) {
                    
                    NSString *prescriptionForPatient = [userInput inputForPrompt:@"Write Prescription"];        // Update patient object with doctor's prescription
                    [patientDB updatePatientPrescription:indexPatByDoc andPrescription:prescriptionForPatient]; // and also decrement request count
                    [doctorDB updateDoctorRequests:indexDocByDoc];                                              // Decrement doctor's request count

                        }
                    }
                }
                }else {
                    // no request
                    NSLog(@"Hey Doc, You don't have any open requests");
                        }
                    }
                }
            }
            else {
                if (![usersOption isEqualToString:@"exit"]) {
                    NSLog(@"Invalid Option");
                }
            }
        }
    } else if ([usersOption isEqualToString:@"patient"]) {
        
        // Initializing the userinput variable with non-exit string
        usersOption = @"startingPatient";
        
        while (![usersOption isEqualToString:@"exit"]) {
            
            // Requesting user for input option
            usersOption = [userInput inputForPrompt:@"\nView Doctors- viewdoc\nBook an Appointment - book\nExit - exit\n"];
            
            if ([usersOption isEqualToString:@"viewdoc"])                                   // Patient views doctors who are available
            {
                [doctorDB displayDoctorsArray];                                             // Doctors array displayed
                
            }   else if ([usersOption isEqualToString:@"book"])                             // Patient wants to book an appointment
            {
                // call method to get accepted
                [patientDB displayPatientsArray];                                           // Patients array displayed
                NSString *selectPat = [userInput inputForPrompt:@"Enter Patient Index"];
                NSUInteger indexTypeShouldNotBeStringPat = [doctorDB indexValueShouldNotbeString:selectPat];        // Checking index entered is not non-numeric
                
                if (indexTypeShouldNotBeStringPat == 0) {

                NSUInteger indexPat = [selectPat intValue];
                NSUInteger validPatientIndex = [patientDB checkIndexInArrayRangePatients:indexPat];  // Checking index entered is not out-of-range of array
                
                if (validPatientIndex == 1) {
                
                NSUInteger whetherPatientwasAccepted = [patientDB canPatientBeAccepted:indexPat];       // Checking the healthcard status for the patient
                
                if (whetherPatientwasAccepted == 1) {
                    
                [doctorDB displayDoctorsArray];
                NSString *selectDocByPatient = [userInput inputForPrompt:@"Enter Doctor Index"];
                NSUInteger indexTypeShouldNotBeStringDoc = [doctorDB indexValueShouldNotbeString:selectDocByPatient];   // Checking index entered is not non-numeric
                    
                if (indexTypeShouldNotBeStringDoc == 0) {
                    
                NSUInteger indexDocByPatient = [selectDocByPatient intValue];
                NSUInteger validDocIndex = [doctorDB checkIndexInArrayRangeDoctors:indexDocByPatient];  // Checking index entered is not out-of-range of array
                    
                if (validDocIndex == 1) {
                [doctorDB sendRequestToDoctor:indexDocByPatient];                                       // Update doctor object with incremented request number
                [patientDB updatePatientRequests:indexPat];                                             // Update patient object with incremented request number
                NSLog(@"Your request has been sent");
                [patientDB displayPatientsArray];                                                       // Display patients array
                            }
                        }
                    }
                }
            }
        }   else {
                if (![usersOption isEqualToString:@"exit"]) {
                    NSLog(@"Invalid Option");
                }
            }
        }
    }   else {
        if (![usersOption isEqualToString:@"quit"]) {
            NSLog(@"Invalid Option");
            }
        }
    }       // while loop end
    NSLog(@"Thanks!! Come back again");
    return 0;
}
