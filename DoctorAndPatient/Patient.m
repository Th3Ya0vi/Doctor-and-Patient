//
//  Patient.m
//  DoctorAndPatient
//
//  Created by Narendra Thapa on 2016-01-14.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (instancetype)initWithPatientName:(NSString *)name andAge:(NSUInteger)age andHealthCard:(BOOL)option
{
    self = [super init];
    if (self) {
        _patientName = name;
        _patientAge = age;
        _healthCard = option;
        _patientTag = @"NO";
    }
    return self;
}

@end
