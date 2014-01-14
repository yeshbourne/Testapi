//
//  TargetLogin.m
//  Target Login
//
//  Created by Yeshwanth.Gowda on 1/13/14.
//  Copyright (c) 2014 Target. All rights reserved.
//

#import "TargetLogin.h"

@implementation TargetLogin


// Initialisation
- (id)init {
    if (self = [super init]) {
        NSLog(@"Loading init");

    }

    return self;
}

    //Method to requesting authentication by passing username and password
-(NSString *)requestAuth :(NSString *)uName :(NSString *) passKey{

    NSDictionary *auth = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                              passKey,
                                                              uName,
                                                              nil]
                                                     forKeys:[NSArray arrayWithObjects:
                                                              @"logonPassword",
                                                              @"logonId",
                                                              nil]];

    NSString *jsonRequest = [self StringToJson:auth];
    NSLog(@"Request: %@", jsonRequest);

    NSURL *url = [NSURL URLWithString:@"https://secure-api.target.com/guests/v3/auth?key=SxR9X7XoWw2fW1PBWfXswf3q5NeIuGAu"];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSData *requestData = [NSData dataWithBytes:[jsonRequest UTF8String] length:[jsonRequest length]];

    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    NSError *errorReturned = nil;
    NSURLResponse *theResponse =[[NSURLResponse alloc]init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
    NSString *returnString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];

    NSLog(@"Data: %@", returnString);
    return returnString;
}

//Creating a json from string
- (NSString *)StringToJson:(NSString *) str {
    NSError *error;
    NSString *JSONString;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:str options:0 error:&error];
    if (!jsonData) {
        NSLog(@"JSON error: %@", error);
    } else {
        JSONString = [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];
    }
    return JSONString;
}

@end
