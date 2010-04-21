#import <AudioToolbox/AudioToolbox.h>

@interface SoundPlayer : NSObject {
	UInt32 sound_ref;

}

+(id)initWithSound:(NSString *)soundName;
+(void)play;
@end
