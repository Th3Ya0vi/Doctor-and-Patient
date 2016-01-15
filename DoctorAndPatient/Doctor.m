//
//  Doctor.m
//  DoctorAndPatient
//
//  Created by Narendra Thapa on 2016-01-14.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor

- (instancetype)initWithDoctorName:(NSString *)name andSpecialization:(NSString *)specialization
{
    self = [super init];
    if (self) {
        _doctorName = name;
        _doctorSpecialization = specialization;
        _requests = 0;
    }
    return self;
}

@end
