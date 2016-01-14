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

- (instancetype)init
{
    self = [super init];
    if (self) {
        _doctors = [[NSMutableArray alloc] init];
        _patients = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addDoctorsToArray:(Doctor *)doctor {
    [self.doctors addObject:doctor];
}

-(void)addPatientsToArray:(Patient *)patient {
    [self.patients addObject:patient];
}

-(void)displayDoctorsArray {
    
    NSUInteger length = [self.doctors count];
    NSLog(@"%lu", (unsigned long)length);
    NSLog(@"Name\t\t\tSpecialist");
    for (int i = 0; i < length; i++){
        Doctor *displaydoctor = [self.doctors objectAtIndex:i];
        NSLog(@"Dr. %@\t\t%@", displaydoctor.doctorName, displaydoctor.doctorSpecialization);
    }
}

-(void)displayPatientsArray {
    
    NSUInteger length = [self.patients count];
    NSLog(@"%lu", (unsigned long)length);
    NSLog(@"Index\tName\tAge\tHC\tRequest");
    for (int i = 0; i < length; i++){
        Patient *displaypatient = [self.patients objectAtIndex:i];
        NSLog(@"(%d) \t%@\t%lu\t%@\t\t%@", i, displaypatient.patientName, (unsigned long)displaypatient.patientAge, displaypatient.healthCard ? @"YES" : @"NO", displaypatient.patientTag);
    }
}

-(void)canPatientBeAccepted:(NSUInteger)index {
        Patient *displaypatient = [self.patients objectAtIndex:index];
    if (displaypatient.healthCard) {
        displaypatient.patientTag = @"YES";
        NSLog(@"Your request has been sent");
    } else {
        NSLog(@"You do not have a health card");
    }
}


@end
