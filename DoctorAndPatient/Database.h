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

-(void)addDoctorsToArray:(Doctor *)doctor;

-(void)addPatientsToArray:(Patient *)patient;

-(void)displayDoctorsArray;

-(void)displayPatientsArray;

-(NSUInteger)canPatientBeAccepted:(NSUInteger)index;

-(void)sendRequestToDoctor:(NSUInteger)index;

-(NSUInteger)verifyDocHasRequests:(NSUInteger)index;

-(void)updatePatientPrescription:(NSUInteger)index andPrescription:(NSString *)string;

-(NSUInteger)verifyPatientHasRaisedRequests:(NSUInteger)index;

@end
