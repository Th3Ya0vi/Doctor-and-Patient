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
    NSLog(@"Index\tName\t\t\tSpecialist\tRequests");
    for (int i = 0; i < length; i++){
        Doctor *displaydoctor = [self.doctors objectAtIndex:i];
        NSLog(@"(%d)\t\tDr. %@\t\t%@\t\t%lu", i, displaydoctor.doctorName, displaydoctor.doctorSpecialization, (unsigned long)displaydoctor.requests);
    }
}

-(void)displayPatientsArray {
    
    NSUInteger length = [self.patients count];
    NSLog(@"%lu", (unsigned long)length);
    NSLog(@"Index\tName\tAge\tHC\tRequest");
    for (int i = 0; i < length; i++){
        Patient *displaypatient = [self.patients objectAtIndex:i];
        NSLog(@"(%d)\t\t%@\t%lu\t%@\t\t%@", i, displaypatient.patientName, (unsigned long)displaypatient.patientAge, displaypatient.healthCard ? @"YES" : @"NO", displaypatient.patientTag);
    }
}

-(NSUInteger)canPatientBeAccepted:(NSUInteger)index {
        Patient *displaypatient = [self.patients objectAtIndex:index];
    if (displaypatient.healthCard) {
        displaypatient.patientTag = @"YES";
        NSUInteger length = [self.doctors count];
        NSLog(@"Index\tName\t\t\tSpecialist");
        for (int i = 0; i < length; i++){
            Doctor *displaydoctor = [self.doctors objectAtIndex:i];
            NSLog(@"(%d)\tDr. %@\t\t%@", i, displaydoctor.doctorName, displaydoctor.doctorSpecialization);
        }
        return 1;
    } else {
        NSLog(@"You do not have a health card");
        return 0;
    }
}

-(void)sendRequestToDoctor:(NSUInteger)index {
    Doctor *displayDoctor = [self.doctors objectAtIndex:index];
    displayDoctor.requests = displayDoctor.requests + 1;
}








@end
