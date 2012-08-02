//
//  ViewController.m
//  HTML
//
//  Created by NYU User on 12/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil
{
	self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void) didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
    
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Create a view hierarchy programmatically, without using a nib.
- (void) loadView
{
    UIWebView *webView =
    [[UIWebView alloc] initWithFrame: [UIScreen mainScreen].applicationFrame];
	webView.contentMode = UIViewContentModeRedraw;
    
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSString *fileName =
    [bundle pathForResource: @"Final_Axel" ofType: @"html"];
    
    NSError *error = nil;
    NSString *html = [NSString stringWithContentsOfFile: fileName
                                               encoding: NSUTF8StringEncoding
                                                  error: &error
                      ];
    
    if (html == nil) {
        NSLog(@"error == %@", error);
        return ;
    }
    
    [webView loadHTMLString: html baseURL: nil];
    
	webView.alpha = 0;
	self.view = webView;
}


// Do additional setup after loading the view, typically from a nib.
- (void) viewDidLoad
{
	[super viewDidLoad];
    
	//Fade in the green band.
	[UIView animateWithDuration: 1
                          delay: 1
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations: ^{
                         self.view.alpha = 1;
                     }
                     completion: NULL
     ];
}


- (void) viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation
{
	// Return YES for supported orientations
	return interfaceOrientation == UIInterfaceOrientationLandscapeLeft;
}

@end
