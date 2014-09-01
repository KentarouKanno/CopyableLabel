//
//  CopyableLabel.m
//  CopyLabel
//
//  Created by KentarOu on 2014/08/25.
//  Copyright (c) 2014年 KentarOu. All rights reserved.
//

#import "CopyableLabel.h"

@implementation CopyableLabel

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self attachTapHandler];
}

- (void)attachTapHandler
{
    [self setUserInteractionEnabled:YES];
    UILongPressGestureRecognizer *touch = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:touch];
}

- (void)copy:(id)sender
{
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    [board setString:self.text];
    self.highlighted = NO;
    
    if (_copyAnimation) {
        [self setAlpha:0.2f];
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationDuration:0.8];
        [self setAlpha:1.0f];
        [UIView commitAnimations];
    }
    
    [self resignFirstResponder];
    
}

- (void) handleTap:(UIGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        [self becomeFirstResponder];
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        CGRect rect = CGRectMake(self.frame.size.width / 2, 2, 0, 0);
        [menu setTargetRect:rect inView:self];
        [menu setMenuVisible:YES animated:YES];
    }
}


-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(copy:));
}

- (BOOL) canBecomeFirstResponder
{
    return YES;
}



@end
