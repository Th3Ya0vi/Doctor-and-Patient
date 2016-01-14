//
//  InputCollector.h
//  DoctorAndPatient
//
//  Created by Narendra Thapa on 2016-01-14.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject

-(NSString *)inputForPrompt:(NSString *)promptString;           // method to ask user for input string


@end
