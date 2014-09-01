//
//  ViewController.m
//  CopyLabel
//
//  Created by KentarOu on 2014/08/25.
//  Copyright (c) 2014年 KentarOu. All rights reserved.
//

#import "ViewController.h"
#import "CopyableLabel.h"

@interface ViewController ()<UIAlertViewDelegate>
{
    UIAlertView *alert;
}

@property (weak, nonatomic) IBOutlet CopyableLabel *copyabeleLabel;
@property (weak, nonatomic) IBOutlet UIButton *alertButton;
@end


@implementation ViewController
            
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(WillResignActive:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:nil];
    
    
    _copyabeleLabel.copyAnimation = YES;
}

- (void)WillResignActive:(NSNotificationCenter*)notfy
{
    [alert dismissWithClickedButtonIndex:0 animated:NO];
}


- (IBAction)showAlert:(id)sender {
    
    alert = [[UIAlertView alloc]initWithTitle:@"title"
                                      message:@"message"
                                     delegate:self
                            cancelButtonTitle:@"OK"
                            otherButtonTitles:nil, nil];
    
    [alert show];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
