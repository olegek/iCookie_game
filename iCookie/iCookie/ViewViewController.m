//
//  ViewViewController.m
//  iCookie
//
//  Created by Guest on 28.09.13.
//  Copyright (c) 2013 OC. All rights reserved.
//

#import "ViewViewController.h"

@interface ViewViewController ()

@end

@implementation ViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// HS for twetter
-(IBAction)tweet:(id)sender{
    TWTweetComposeViewController *twitter = [[TWTweetComposeViewController alloc]init];
    [twitter setInitialText:@"my hight score = "];
    [self presentViewController:twitter animated:YES completion:nil];
    
    twitter.completionHandler = ^(TWTweetComposeViewControllerResult res){
        
        if(res == TWTweetComposeViewControllerResultDone){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:@"The tweet was posted succesful" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
            
            [alert show];
        }
        else if (res == TWTweetComposeViewControllerResultCancelled){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"canceled" message:@"You canceled posting the Tweet" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
            
            [alert show];
        }
        [self dismissModalViewControllerAnimated:YES];
    };
}
// sharing with friends
- (IBAction)email:(id)sender {
    MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate=self;
    NSArray *emailAddresses = [[NSArray alloc] initWithObjects:@"iCookie", nil];
    NSString *sendSubject = [[NSString alloc] initWithFormat:@"iCookie app"];
    NSString *sendMessage = [[NSString alloc] initWithFormat:@"bla bla bla"];
    
    [mailComposer setToRecipients:emailAddresses];
    [mailComposer setSubject:sendSubject];
    [mailComposer setMessageBody:sendMessage isHTML:NO];
    [self presentViewController:mailComposer animated:YES completion:NULL];
}


-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
//Leaderbord

-(IBAction)showLeader{
    GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
    if (leaderboardController != nil) {
        leaderboardController.leaderboardDelegate = self;
        [self presentViewController:leaderboardController animated:YES completion:NULL];
    }
}

-(void)leaderboardViewControllerDidFinish: (GKLeaderboardViewController *)viewController{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
