//
//  Doctor.m
//  DoctorAndPatient
//
//  Created by Narendra Thapa on 2016-01-14.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor

- (instancetype)init
{
    self = [super init];
    if (self) {
        _doctorSerialNumber = 0;
    }
    return self;
}

- (instancetype)initWithDoctorName:(NSString *)name andSpecialization:(NSString *)specialization
{
    self = [super init];
    if (self) {
        _doctorSerialNumber = _doctorSerialNumber + 1;
        _doctorName = name;
        _doctorSpecialization = specialization;
    }
    return self;
}

@end
