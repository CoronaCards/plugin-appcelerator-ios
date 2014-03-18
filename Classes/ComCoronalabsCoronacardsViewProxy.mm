/**
 */

#import "ComCoronalabsCoronacardsViewProxy.h"
#import "TiUtils.h"

@implementation ComCoronalabsCoronacardsViewProxy

- (void)run:(id)args
{
	[[self view] performSelectorOnMainThread:@selector(run:) withObject:args waitUntilDone:NO];
//	TiUIView* view = [self view];
//	NSLog( @"ViewProxy view: %@", view ? view : @"nil" );
//	[view run:args];
}

@end
