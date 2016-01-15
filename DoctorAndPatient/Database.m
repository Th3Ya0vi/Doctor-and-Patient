//
//  Database.m
//  DoctorAndPatient
//
//  Created by Narendra Thapa on 2016-01-14.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "Database.h"
#import "Doctor.h"
#import "Patient.h"

@implementation Database

// Allocates and initializes doctor and patient array
- (instancetype)init
{
    self = [super init];
    if (self) {
        _doctors = [[NSMutableArray alloc] init];
        _patients = [[NSMutableArray alloc] init];
    }
    return self;
}

// Add doctor object to doctor array
-(void)addDoctorsToArray:(Doctor *)doctor {
    [self.doctors addObject:doctor];
}

// Add patient object to patient array
-(void)addPatientsToArray:(Patient *)patient {
    [self.patients addObject:patient];
}

// Displays list of doctors
-(void)displayDoctorsArray {
    
    NSUInteger length = [self.doctors count];
    NSLog(@"Index\tName\t\t\tSpecialist\tRequests\tPatients Checked");
    for (int i = 0; i < length; i++){
        Doctor *displaydoctor = [self.doctors objectAtIndex:i];
        NSLog(@"(%d)\t\tDr. %@\t\t%@\t\t\t%lu\t\t%@", i, displaydoctor.doctorName, displaydoctor.doctorSpecialization, (unsigned long)displaydoctor.requests, displaydoctor.patientsChecked);
    }
}

// Displays list of patients
-(void)displayPatientsArray {
    
    NSUInteger length = [self.patients count];
    NSLog(@"Index\tName\tAge\tHC\tRequest\tPrescription");
    for (int i = 0; i < length; i++){
        Patient *displaypatient = [self.patients objectAtIndex:i];
        NSLog(@"(%d)\t\t%@\t%lu\t%@\t\t%lu\t%@", i, displaypatient.patientName, (unsigned long)displaypatient.patientAge, displaypatient.healthCard ? @"YES" : @"NO", (unsigned long)displaypatient.patientRequests, displaypatient.patientPrescription);
    }
}

// Checks patient HealthCard value
-(NSUInteger)canPatientBeAccepted:(NSUInteger)index {
        Patient *displaypatient = [self.patients objectAtIndex:index];
    if (displaypatient.healthCard) {
        return 1;
    } else {
        NSLog(@"You do not have a health card");
        return 0;
    }
}

// Checks index value entered for patient is not beyond length of array
-(NSUInteger)checkIndexInArrayRangePatients:(NSUInteger)index {
    NSUInteger length = [self.patients count];
    if (index < length) {
        return 1;
    } else {
        NSLog(@"Your index is out of range");
        return 0;
    }
}

// Checks index value entered for doctor is not beyond length of array
-(NSUInteger)checkIndexInArrayRangeDoctors:(NSUInteger)index {
    NSUInteger length = [self.doctors count];
    if (index < length) {
        return 1;
    } else {
        NSLog(@"Your index is out of range");
        return 0;
    }
}

// Update doctor request count (increment)
-(void)sendRequestToDoctor:(NSUInteger)index {
    Doctor *displayDoctor = [self.doctors objectAtIndex:index];
    displayDoctor.requests = displayDoctor.requests + 1;
}

// Update patient request count (increment)
-(void)updatePatientRequests:(NSUInteger)index {
    Patient *displaypatient = [self.patients objectAtIndex:index];
    displaypatient.patientRequests = displaypatient.patientRequests + 1;
}

// Checks if doctor request number is more than 0
-(NSUInteger)verifyDocHasRequests:(NSUInteger)index {
    Doctor *openRequests = [self.doctors objectAtIndex:index];
    if (openRequests.requests >= 1) {
        return 1;
    } else {
        return 0;
    }
}

// Checks if patient request number is more than 0
-(NSUInteger)verifyPatientHasRaisedRequests:(NSUInteger)index {
    Patient *openRequest = [self.patients objectAtIndex:index];
    if (openRequest.patientRequests >= 1) {
        return 1;
    } else {
        NSLog(@"This patient does not have an open request");
        return 0;
    }
}

// Add prescription to patient object and decrement request count
-(NSString *)updatePatientPrescription:(NSUInteger)patientIndex andPrescription:(NSString *)string {
    Patient *displayPatient = [self.patients objectAtIndex:patientIndex];
    [displayPatient.patientPrescription addObject:string];
    displayPatient.patientRequests = displayPatient.patientRequests - 1;
    return displayPatient.patientName;
}

// Update doctor request count (decrement)
-(void)updateDoctorRequests:(NSUInteger)doctorIndex andPatientTreated:(NSString *)nameString {
    Doctor *openRequests = [self.doctors objectAtIndex:doctorIndex];
    openRequests.requests = openRequests.requests - 1;
    [openRequests.patientsChecked addObject:nameString];
}

// Checks that user input for index is not string if string is entered its converted to integer value of 0
-(NSUInteger)indexValueShouldNotbeString:(NSString *)inputString {
    NSUInteger num = [inputString intValue];
    NSUInteger inputType = 9;
                                                                // Checking to see is user has input 0
    if ([inputString isEqualToString:@"0"] && num == 0) {
        //NSLog(@"Index value should not be 0");
        inputType = 0;
    }                                                           // Checking to see if user has input a numeric value
    else if (num != 0){
        //NSLog(@"Index value should not be 1");
        inputType = 0;
    }                                                           // Input is not a numeric value
    else {
        NSLog(@"Index value should not be a string");
        inputType = 1;
    }
    return inputType;
}




@end
