#import <Foundation/Foundation.h>
#import <ApplicationServices/ApplicationServices.h>
#import <cocoa/Cocoa.h>
#import <AppKit/AppKit.h>
#import <AppKit/NSEvent.h>
@import AppKit;

int main (int argc, const char * argv[])
{
   @autoreleasepool {
	[NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyDownMask
       	                               handler:^(NSEvent *event){
		 NSString *chars = [[event characters] lowercaseString];
	 	 unichar character = [chars characterAtIndex:0];
  	         NSLog(@"keydown globally! Which key? This key: %c", character);
	}];
   	NSWorkspace *ws = [NSWorkspace sharedWorkspace];
	NSArray *args = [NSProcessInfo processInfo].arguments;
	NSScreen *screen = [NSScreen mainScreen];
	NSError *err;
	bool success = [ws setDesktopImageURL:[NSURL fileURLWithPath:args[1]]
			   forScreen:screen
			   options:[ws desktopImageOptionsForScreen:screen]
			   error:&err];
	
	if(success){
		        NSLog(@"%s",err.localizedDescription.UTF8String);
	}

   }
   return 0;
}
