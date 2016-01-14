//
//  Patient.m
//  DoctorAndPatient
//
//  Created by Narendra Thapa on 2016-01-14.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (instancetype)initWithPatientName:(NSString *)name andAge:(NSNumber *)age
{
    self = [super init];
    if (self) {
        _patientName = name;
        _patientAge = age;
    }
    return self;
}

@end
