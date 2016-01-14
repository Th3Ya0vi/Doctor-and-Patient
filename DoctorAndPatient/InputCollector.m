//
//  InputCollector.m
//  DoctorAndPatient
//
//  Created by Narendra Thapa on 2016-01-14.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

-(NSString *)inputForPrompt:(NSString *)promptString {
    char inputChoice[255];
    NSLog(@"\n%@", promptString);
    fgets(inputChoice, 255, stdin);
    NSString *userString = [NSString stringWithUTF8String:inputChoice];
    NSUInteger length = [userString length];
    userString = [userString substringToIndex:length - 1];
    return userString;
}

@end
