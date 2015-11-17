

//
//  AddQuoteViewController.m
//  Lab5
//
//  Created by Elif Naz Aydin on 10/26/15.
//  Copyright © 2015 Elif Aydin. All rights reserved.
//

#import "AddQuoteViewController.h"


@interface AddQuoteViewController () <UITextFieldDelegate, UITextViewDelegate>


@property (weak, nonatomic) IBOutlet UITextView *quoteTextView;

@property (weak, nonatomic) IBOutlet UITextField *authorTextField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddQuoteViewController


- (void) viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [self.quoteTextView becomeFirstResponder];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.quoteTextView.text = @"";
    self.saveButton.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    
    if (self.quoteTextView.hasText && self.authorTextField.hasText) {
        self.saveButton.enabled = YES;
    } else {
        self.saveButton.enabled = NO;
    }

    
    return YES;
}




- (IBAction) saveButtonTapped: (id)sender {
    
    
    
    [self.quoteTextView resignFirstResponder];
    if (self.completionHandler) {
        self.completionHandler(self.quoteTextView.text, self.authorTextField.text);
    }
    self.quoteTextView.text = nil;
    self.authorTextField.text = nil;
        
    
    
}

- (IBAction)cancelButtonTapped:(id)sender {
    
    [self.view endEditing:YES];
    if (self.completionHandler) {
        self.completionHandler(nil, nil);
    }
    
    self.quoteTextView.text = nil;
    self.authorTextField.text = nil;
}


- (void) enableSaveButtonForQuote: (NSString *) quoteText
                           author: (NSString *) authorText {
    self.saveButton.enabled = (quoteText.length > 0 &&
                               authorText.length > 0);
    
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString * changedString = [textField.text
                                stringByReplacingCharactersInRange:range withString:string];
    
    [self enableSaveButtonForQuote:self.quoteTextView.text author:changedString];
    
    return YES;
}
-(BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{

    NSString * changedString = [textView.text
                              stringByReplacingCharactersInRange:range withString:text];
    
    [self enableSaveButtonForQuote:changedString author:self.authorTextField.text];
    
    return YES;

    
    
}

@end