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
        
        usersOption = [userInput inputForPrompt:@"\nAdd new doctor record - adddoc\nAdd new patient record - addpat\nView Patients- viewpat\nView Doctors - viewdoc\nTreat a patient - treat\nExit - exit\n"];
            
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
            else if ([usersOption isEqualToString:@"treat"])
            {
                // display doc list to identify which doc has open requests
                [doctorDB displayDoctorsArray];
                NSString *selectDocByDoc = [userInput inputForPrompt:@"Enter Doctor Index"];
                NSUInteger indexDocByDoc = [selectDocByDoc intValue];
                
                NSUInteger validDocIndex = [doctorDB checkIndexInArrayRangeDoctors:indexDocByDoc];
                
                if (validDocIndex == 1) {
                    
                // verify doc has request
                NSUInteger doesDocHasRequests = [doctorDB verifyDocHasRequests:indexDocByDoc];

                if (doesDocHasRequests == 1) {
                    
                    // check patient index before writing prescription
                    [patientDB displayPatientsArray];
                    NSString *selectPatByDoc = [userInput inputForPrompt:@"Enter Patient Index"];
                    NSUInteger indexPatByDoc = [selectPatByDoc intValue];
                    
                    NSUInteger validPatientIndex = [patientDB checkIndexInArrayRangePatients:indexPatByDoc];
                    
                    if (validPatientIndex == 1) {
                    
                    NSUInteger patientHasRaisedRequest = [patientDB verifyPatientHasRaisedRequests:indexPatByDoc];
                    
                    if (patientHasRaisedRequest == 1) {
                    
                    NSString *prescriptionForPatient = [userInput inputForPrompt:@"Write Prescription"];
                    [patientDB updatePatientPrescription:indexPatByDoc andPrescription:prescriptionForPatient];
                    [doctorDB updateDoctorRequests:indexDocByDoc];

                    }
                }
                    
                } else {
                    // no request
                    NSLog(@"Hey Doc, You don't have any open requests");
                        }
                }
//                    else
//                    {
//                        NSLog(@"Your index is out of range");
//                    }
                
            }
        }
    } else if ([usersOption isEqualToString:@"patient"]) {
        
        usersOption = @"startingPatient";
        
        while (![usersOption isEqualToString:@"exit"]) {
            
            usersOption = [userInput inputForPrompt:@"\nView Doctors- viewdoc\nBook an Appointment - book\nExit - exit\n"];
            
            if ([usersOption isEqualToString:@"viewdoc"])
            {
                [doctorDB displayDoctorsArray];
                
            }
            else if ([usersOption isEqualToString:@"book"])
            {
                // call method to get accepted
                [patientDB displayPatientsArray];
                NSString *selectPat = [userInput inputForPrompt:@"Enter Patient Index"];
                NSUInteger indexPat = [selectPat intValue];
                
                NSUInteger validPatientIndex = [patientDB checkIndexInArrayRangePatients:indexPat];
                
                if (validPatientIndex == 1) {
                NSUInteger whetherPatientwasAccepted = [patientDB canPatientBeAccepted:indexPat];
                
                if (whetherPatientwasAccepted == 1) {
                    [doctorDB displayDoctorsArray];
                NSString *selectDocByPatient = [userInput inputForPrompt:@"Enter Doctor Index"];
                NSUInteger indexDocByPatient = [selectDocByPatient intValue];
                
                NSUInteger validDocIndex = [doctorDB checkIndexInArrayRangeDoctors:indexDocByPatient];
                    
                    if (validDocIndex == 1) {
                    [doctorDB sendRequestToDoctor:indexDocByPatient];
                        [patientDB updatePatientRequests:indexPat];
                    NSLog(@"Your request has been sent");
                    [patientDB displayPatientsArray];
                }
//                    else {
//                        NSLog(@"Your index is out of range");
//                        }
                    }
                }
//                else {
//                    NSLog(@"Your index is out of range");
//                }
                // need this to ask user for index and pick a doc
                
            }
        }
    } else {
        if (![usersOption isEqualToString:@"quit"]) {
            NSLog(@"Invalid Option");
        }
    }
    
    }       // while loop end
    
    NSLog(@"Thanks!! Come back again");
    
    
    return 0;
}
