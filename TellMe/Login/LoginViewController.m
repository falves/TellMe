//
//  LoginViewController.m
//  TellMe
//
//  Created by Felipe on 06/08/12.
//  Copyright (c) 2012 Bolzani. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end


@implementation LoginViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)pressionouFbLogin:(id)sender {

    // The permissions requested from the user
    NSArray *permissionsArray = [NSArray arrayWithObjects:@"user_about_me",
                                 @"user_relationships",@"user_birthday",@"user_location",
                                 @"offline_access", nil];
    
    // Log in
    [PFFacebookUtils logInWithPermissions:permissionsArray
                                    block:^(PFUser *user, NSError *error) {
                                        if (!user) {
                                            if (!error) { // The user cancelled the login
                                                NSLog(@"Uh oh. The user cancelled the Facebook login.");
                                            } else { // An error occurred
                                                NSLog(@"Uh oh. An error occurred: %@", error);
                                            }
                                        } else if (user.isNew) { // Success - a new user was created
                                            NSLog(@"User with facebook signed up and logged in!");
                                            [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
                                            [self dismissModalViewControllerAnimated:YES];

                                        } else { // Success - an existing user logged in
                                            NSLog(@"User with facebook logged in!");
                                            [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
                                            [self dismissModalViewControllerAnimated:YES];
                                        }
                                    }];
    
}

@end
