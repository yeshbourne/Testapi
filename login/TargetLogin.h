//
//  TargetLogin.h
//  Target Login
//
//  Created by Yeshwanth.Gowda on 1/13/14.
//  Copyright (c) 2014 Target. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TargetLogin : NSObject

-(NSString *)requestAuth :(NSString *)uName :(NSString *) passKey;

@end
