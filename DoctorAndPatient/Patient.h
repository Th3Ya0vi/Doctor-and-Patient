//
//  Patient.h
//  DoctorAndPatient
//
//  Created by Narendra Thapa on 2016-01-14.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Patient : NSObject

@property (nonatomic, copy) NSString *patientName;
@property (nonatomic, assign) NSUInteger patientAge;
@property (nonatomic, copy) NSString *patientTag;
@property (nonatomic) BOOL healthCard;
@property (nonatomic, strong) NSMutableArray *patientPrescription;

- (instancetype)initWithPatientName:(NSString *)name andAge:(NSUInteger)age andHealthCard:(BOOL)option;

@end
