    //
//  MainViewController.m
//  gong-hd
//
//  Created by David on 21/04/10.
//  Copyright 2010 Resolve Digital Ltd. All rights reserved.
//

#import "MainViewController_Pad.h"
#import "SoundPlayer.h"

@implementation MainViewController_Pad

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {

    }
    return self;
}


/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */


- (void)flipsideViewControllerDidFinish:(FlipsideViewController_Pad *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo {    
	
	FlipsideViewController_Pad *controller = [[FlipsideViewController_Pad alloc] initWithNibName:@"FlipsideView_Pad" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	SoundPlayer *player = [SoundPlayer initWithSound:@"gong"];
	[player play];
	[player release];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}



- (void)dealloc {
    [super dealloc];
}


@end