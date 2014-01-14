//
//  ViewController.m
//  Target Login
//
//  Created by Yeshwanth.Gowda on 1/13/14.
//  Copyright (c) 2014 Target. All rights reserved.
//

#import "ViewController.h"
#import "TargetLogin.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  [self.submit addTarget:self action:@selector(submitBtn) forControlEvents:UIControlEventTouchUpInside];
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];

}

- (void)hideKeyboard
{
    [self.view endEditing:YES];
}


-(void)submitBtn{
    TargetLogin *tl=[[TargetLogin alloc] init];
    NSLog(@"username:%@",self.userName.text);
    NSLog(@"password:%@",self.passkey.text);
    [self.response setText:[tl requestAuth :self.userName.text :self.passkey.text]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
