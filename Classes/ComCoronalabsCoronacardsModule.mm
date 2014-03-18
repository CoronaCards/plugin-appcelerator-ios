/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComCoronalabsCoronacardsModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

/*
#import "CoronaKit/CoronaKit.h"

@interface CoronaViewTiProxy : TiProxy

- (id)initWithFrame:(CGRect)frame parentController:(UIViewController *)parentController;

@end

@interface CoronaViewTiProxy()
@property (nonatomic, retain) CoronaViewController *coronaViewController;
@end

@implementation CoronaViewTiProxy

- (id)initWithFrame:(CGRect)frame parentController:(UIViewController *)parentController
{
	self = [super init];
	
	if ( self )
	{
		CoronaViewController *coronaController = [[CoronaViewController alloc] init];
		_coronaViewController = coronaController;

		[parentController addChildViewController:coronaController];

		CoronaView *coronaView = (CoronaView *)coronaController.view;

		// Options
		coronaView.frame = frame;

		// NOTE: Defer adding coronaController.view to parent until we call 'run:'
	}
	
	return self;
}

- (void)dealloc
{
	[_coronaViewController release];

	[super dealloc];
}

- (void)run:(id)args
{
NSLog( @"run: %@", args );
	CoronaViewController *coronaController = _coronaViewController;
	CoronaView *coronaView = (CoronaView *)coronaController.view;

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
	CoronaView *coronaView = (CoronaView *)coronaController.view;
	[coronaView suspend];
}

- (void)resume:(id)args
{
	CoronaViewController *coronaController = _coronaViewController;
	CoronaView *coronaView = (CoronaView *)coronaController.view;
	[coronaView resume];
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
	CoronaViewController *coronaController = _coronaViewController;
	CoronaView *coronaView = (CoronaView *)coronaController.view;

	NSDictionary *event = [args objectAtIndex:0];
	[coronaView sendEvent:event];
}

@end
*/

//@interface ComCoronalabsCoronacardsModule()
//@property (nonatomic, retain) NSMutableDictionary *coronaControllers;
//@end
//

@implementation ComCoronalabsCoronacardsModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"51349171-b6e0-4ec4-a062-c86522b6d1cb";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.coronalabs.coronacards";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
//	_coronaControllers = [[NSMutableDictionary alloc] init];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
//	[_coronaControllers release];

	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

/*
-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}
*/

/*
static CGRect
InitFrame( NSDictionary *options, CGRect defaultFrame )
{
	CGRect frame = defaultFrame;

	NSNumber *x = [options valueForKey:@"x"];
	if ( x )
	{
		frame.origin.x = [x floatValue];
	}
	NSNumber *y = [options valueForKey:@"y"];
	if ( y )
	{
		frame.origin.y = [y floatValue];
	}
	NSNumber *w = [options valueForKey:@"width"];
	if ( w )
	{
		frame.size.width = [w floatValue];
	}
	NSNumber *h = [options valueForKey:@"height"];
	if ( h )
	{
		frame.size.height = [h floatValue];
	}

	return frame;
}

- (id)createView:(id)args
{
	CoronaViewTiProxy *coronaViewProxy = nil;

	TiRootViewController *controller = [TiApp app].controller;

	// Options
//	ENSURE_SINGLE_ARG
	id arg0 = [args objectAtIndex:0];
	if ( [arg0 isKindOfClass:[NSDictionary class]] )
	{
		NSDictionary *options = (NSDictionary *)arg0;
		CGRect frame = InitFrame( options, controller.view.frame );
	
NSLog( @"parentController: %@", controller );
NSLog( @"x,y,w,h = %g,%g,%g,%g", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height );
		coronaViewProxy = [[[CoronaViewTiProxy alloc] initWithFrame:frame parentController:controller] autorelease];
	}
	else
	{
		NSLog( @"[CoronaCards] ERROR: createView requires an NSDictionary as the first param." );
	}

NSLog( @"createView returning: %p, %@", coronaViewProxy, coronaViewProxy );

	return coronaViewProxy;
}
*/

@end
