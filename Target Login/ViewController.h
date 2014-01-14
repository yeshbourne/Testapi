//
//  ViewController.h
//  Target Login
//
//  Created by Yeshwanth.Gowda on 1/13/14.
//  Copyright (c) 2014 Target. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{

IBOutlet UITextField *userName;
IBOutlet UITextField *passkey;
IBOutlet UIButton *submit;
IBOutlet UITextView *response;
}
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passkey;
@property (weak, nonatomic) IBOutlet UIButton *submit;
@property (weak, nonatomic) IBOutlet UITextView *response;

@end
