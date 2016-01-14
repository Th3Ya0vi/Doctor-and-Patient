//
//  Doctor.h
//  DoctorAndPatient
//
//  Created by Narendra Thapa on 2016-01-14.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Doctor : NSObject

@property (nonatomic, copy) NSString *doctorName;
@property (nonatomic, copy) NSString *doctorSpecialization;
@property (nonatomic, copy) NSString *doctorTag;
@property (nonatomic) NSUInteger doctorSerialNumber;

- (instancetype)initWithDoctorName:(NSString *)name andSpecialization:(NSString *)specialization;

@end
