#import "SoundPlayer.h"


@implementation SoundPlayer

+ (id)initWithSound:(NSString *)soundName {
    if (self = [super init]) {
		sound_ref = 1024;
		NSString *filename=[[NSBundle mainBundle] pathForResource:soundName ofType:@"au"];
		AudioServicesCreateSystemSoundID ((CFURLRef)[NSURL fileURLWithPath:filename], &sound_ref);
		
	}
	return self;
}

+ (void)play {
	AudioServicesPlaySystemSound (sound_ref);
}
	
- (void)dealloc {
   	AudioServicesDisposeSystemSoundID (sound_ref);
	[super dealloc];
}


@end
