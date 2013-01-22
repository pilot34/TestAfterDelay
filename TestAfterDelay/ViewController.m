//
//  ViewController.m
//  TestAfterDelay
//
//  Created by Gleb Tarasov on 23.01.13.
//  Copyright (c) 2013 Gleb Tarasov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self layout];
}


- (IBAction)dismiss:(id)sender
{
    [self.textField1 resignFirstResponder];
    [self.textField2 resignFirstResponder];
}

- (void)layout
{
    BOOL keyboardVisible = self.textField1.isFirstResponder || self.textField2.isFirstResponder;
    CGFloat textField1Top = keyboardVisible ? 100 : 370;
    CGFloat textField2Top = keyboardVisible ? 150 : 420;
    
    CGRect frame1 = self.textField1.frame;
    frame1.origin.y = textField1Top;
    self.textField1.frame = frame1;
    
    CGRect frame2 = self.textField2.frame;
    frame2.origin.y = textField2Top;
    self.textField2.frame = frame2;
}

- (void)layoutAnimated
{
    [UIView animateWithDuration:0.3 animations:^{
        [self layout];
    }];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    // чтоб не дергалось слегка откладываем
//    [self performSelector:@selector(layoutAnimated) withObject:nil afterDelay:0];
    
    [self layoutAnimated];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    // чтоб не дергалось слегка откладываем
//    [self performSelector:@selector(layoutAnimated) withObject:nil afterDelay:0];
    
    [self layoutAnimated];
}

@end
