/**
 */

#import "ComCoronalabsCoronacardsView.h"

#import "CoronaCards/CoronaCards.h"

@interface ComCoronalabsCoronacardsView()
@property (nonatomic, retain) CoronaViewController *coronaViewController;
@end


@implementation ComCoronalabsCoronacardsView

- (id)init
{
	return [super init];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	return [super initWithCoder:aDecoder];
}

- (id)initWithFrame:(CGRect)frame
{
	return [super initWithFrame:frame];
}

- (void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
	if ( _coronaViewController )
	{
		[TiUtils setView:_coronaViewController.view positionRect:bounds];
	}
}

- (CoronaView *)coronaView
{
	if ( nil == _coronaViewController )
	{
		CoronaViewController *coronaController = [[CoronaViewController alloc] init];
		_coronaViewController = coronaController;

		TiRootViewController *parentController = [TiApp app].controller;
		[parentController addChildViewController:coronaController];

		CoronaView *coronaView = (CoronaView *)coronaController.view;

		// Default to the parent controller's view frame
		// Corona cannot be init'd to a rect of size, CGRectZero
		CGRect frame = CGRectUnion( [self frame], parentController.view.frame );
		coronaView.frame = frame;

		// NOTE: Defer adding coronaController.view to parent until we call 'run:'
	}
	
	return (CoronaView *)_coronaViewController.view;
}

- (void)dealloc
{
	[_coronaViewController release];

	[super dealloc];
}

- (void)run:(id)args
{
NSLog( @"run: %@", args );
	CoronaView *coronaView = [self coronaView];
	CoronaViewController *coronaController = _coronaViewController;

	// Once we start running main.lua, we add the CoronaView
	// instance into the parent view.
	UIViewController *parentController = coronaController.parentViewController;
	[parentController.view addSubview:coronaView];

	NSString *path = [args objectAtIndex:0];
	path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:path];

NSLog( @"run path: %@", path );
	NSDictionary *params = [args objectAtIndex:1];
	if ( [NSNull null] == (id)params )
	{
		params = nil;
	}
NSLog( @"run params: %@", ( params ? params : @"nil" ) );

	[coronaView runWithPath:path parameters:params];
}

- (void)suspend:(id)args
{
	CoronaViewController *coronaController = _coronaViewController;
	if ( coronaController )
	{
		CoronaView *coronaView = (CoronaView *)coronaController.view;
		[coronaView suspend];
	}
}

- (void)resume:(id)args
{
	CoronaViewController *coronaController = _coronaViewController;
	if ( coronaController )
	{
		CoronaView *coronaView = (CoronaView *)coronaController.view;
		[coronaView resume];
	}
}

- (void)close:(id)args
{
	CoronaViewController *coronaController = _coronaViewController;

	coronaController.paused = YES;
	[coronaController.view removeFromSuperview];
	[coronaController removeFromParentViewController];
}

- (void)sendEvent:(id)args
{
	CoronaView *coronaView = [self coronaView];
	CoronaViewController *coronaController = _coronaViewController;

	NSDictionary *event = [args objectAtIndex:0];
	[coronaView sendEvent:event];
}

@end
