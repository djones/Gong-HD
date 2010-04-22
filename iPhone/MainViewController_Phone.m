//
//  MainViewController.m
//  gong-hd
//
//  Created by David on 21/04/10.
//  Copyright 2010 Resolve Digital Ltd. All rights reserved.
//

#import "MainViewController_Phone.h"
#import "SoundPlayer.h"
#import <QuartzCore/QuartzCore.h>

@implementation MainViewController_Phone

@synthesize gong;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {

    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *aTouch = [touches anyObject];
	CGPoint loc = [aTouch locationInView:self.view];
	
	CGRect buttonDeadZone;
	
	if(self.interfaceOrientation == UIInterfaceOrientationPortrait || self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){
		buttonDeadZone = CGRectMake(0, (self.view.frame.size.height - 100), 100, 100);
	} else {
		buttonDeadZone = CGRectMake(0, (self.view.frame.size.width - 100), 100, 100);
	}
	
	if(!CGRectContainsPoint(buttonDeadZone, loc)){
		AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
		
		SoundPlayer *player = [SoundPlayer initWithSound:@"gong"];
		[player play];
		[player release];
		
		// create a CGPath that implements two arcs (a bounce)
		CGMutablePathRef thePath = CGPathCreateMutable();
		
		CGMutablePathRef shakePath = CGPathCreateMutable();
		CGPathMoveToPoint(shakePath, NULL, self.gong.center.x, self.gong.center.y);
		int index;
		for (index = 0; index < 50; ++index)
		{
			int shakeAmount = ((50 - index) / 10);
			
			CGPathAddLineToPoint(shakePath, NULL, (self.gong.center.x + shakeAmount), self.gong.center.y);
			CGPathAddLineToPoint(shakePath, NULL, (self.gong.center.x - shakeAmount), self.gong.center.y);
		}
		CGPathCloseSubpath(shakePath);
		
		CAKeyframeAnimation *theAnimation;
		
		// create the animation object, specifying the position property as the key path
		// the key path is relative to the target animation object (in this case a CALayer)
		theAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
		theAnimation.path=shakePath;
		
		// set the duration to 5.0 seconds
		theAnimation.duration=5.0;
		
		
		// release the path
		CFRelease(thePath);
		
		[self.gong addAnimation:theAnimation forKey:@"shake"];
	}

}

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */


- (void)flipsideViewControllerDidFinish:(FlipsideViewController_Phone *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo {    
	
	FlipsideViewController_Phone *controller = [[FlipsideViewController_Phone alloc] initWithNibName:@"FlipsideView_Phone" bundle:nil];
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


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	[self.gong.layer removeAllAnimations];
	
    // Overriden to allow any orientation.
    return YES;
}


- (void)dealloc {
    [super dealloc];
}


@end