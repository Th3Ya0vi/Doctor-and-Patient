//
//  Database.h
//  DoctorAndPatient
//
//  Created by Narendra Thapa on 2016-01-14.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "Patient.h"

@interface Database : NSObject

@property (nonatomic, strong) NSMutableArray *doctors;
@property (nonatomic, strong) NSMutableArray *patients;

-(void)addDoctorsToArray:(Doctor *)doctor;                          // Add doctor object to doctor array

-(void)addPatientsToArray:(Patient *)patient;                       // Add patient object to patient array

-(void)displayDoctorsArray;                                         // Displays list of doctors

-(void)displayPatientsArray;                                        // Displays list of patients

-(NSUInteger)canPatientBeAccepted:(NSUInteger)index;                // Checks patient HealthCard value

-(void)sendRequestToDoctor:(NSUInteger)index;                       // Update doctor request count (increment)

-(void)updatePatientRequests:(NSUInteger)index;                     // Update patient request count (increment)

-(NSUInteger)verifyDocHasRequests:(NSUInteger)index;                // Checks if doctor request number is more than 0

-(NSUInteger)verifyPatientHasRaisedRequests:(NSUInteger)index;      // Checks if patient request number is more than 0

-(NSString *)updatePatientPrescription:(NSUInteger)patientindex andPrescription:(NSString *)string;   // Add prescription to patient object and decrement request count

-(void)updateDoctorRequests:(NSUInteger)doctorIndex andPatientTreated:(NSString *)nameString;   // Update doctor request count (decrement)

-(NSUInteger)checkIndexInArrayRangePatients:(NSUInteger)index;      // Checks index value entered for patient is not beyond length of array

-(NSUInteger)checkIndexInArrayRangeDoctors:(NSUInteger)index;       // Checks index value entered for doctor is not beyond length of array

-(NSUInteger)indexValueShouldNotbeString:(NSString *)inputString;   // Checks that user input for index is not string
                                                                    // if string is entered its converted to integer value of 0
@end
