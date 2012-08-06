//
//  HomeViewController.m
//  TellMe
//
//  Created by Felipe on 06/08/12.
//  Copyright (c) 2012 Bolzani. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"

@interface HomeViewController ()

- (void) fazerLoginSeNecessario;

@end

@implementation HomeViewController

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
    
    self.title = @"Home";
     
    [self fazerLoginSeNecessario];
    
    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Logout"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(logout)];
    self.navigationItem.rightBarButtonItem = logoutButton;
    
    
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

- (void) fazerLoginSeNecessario {
    
    if (![PFUser currentUser] || // Check if a user is cached
        ![PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) // Check if user is linked to Facebook
    {
        UIStoryboard *storyboard = [UIApplication sharedApplication].delegate.window.rootViewController.storyboard;
        LoginViewController * login = [storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
        [self presentModalViewController:login animated:NO];

    }
}

- (void) logout {

    [PFUser logOut];
    [self fazerLoginSeNecessario];
    
}

@end
