//
//  BiblicalTextViewController.m
//  Reading Plan
//
//  Created by Samuel Freney on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BiblicalTextViewController.h"


@implementation BiblicalTextViewController

@synthesize biblePassages, bibleTextWebView;//, responseData;


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor]; 
    self.title = [NSString stringWithFormat:@"Fetching %@...", biblePassages];
    
    // Initialise the search indicator up in the top right.
	// Initialise the search indicator up in the top right.
	CGRect frame = CGRectMake(0.0, 0.0, 25.0, 25.0);
	activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:frame];
	[activityIndicator startAnimating];
	[activityIndicator sizeToFit];
	activityIndicator.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
                                          UIViewAutoresizingFlexibleRightMargin |
                                          UIViewAutoresizingFlexibleTopMargin |
                                          UIViewAutoresizingFlexibleBottomMargin);
	
	activityIndicatorBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator];
	activityIndicatorBarButtonItem.target = self;
	self.navigationItem.rightBarButtonItem = activityIndicatorBarButtonItem;
    
    textFontSize = 100;
    
    NSString *urlBaseAddress = @"http://www.esvapi.org/v2/rest/passageQuery?key=IP&passage=";
    
    NSString *urlPassageAddress = [biblePassages stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    NSString *urlOptions = @"&include-passage-references=FALSE";
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@", urlBaseAddress, urlPassageAddress, urlOptions]];
    
    // Create the request.
    NSURLRequest *urlRequest=[NSURLRequest requestWithURL:url 
                                              cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                          timeoutInterval:60.0];

    // create the connection with the request and start loading the data
    //NSURLConnection *connection = [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    
    if (connection) {
        responseData = [[NSMutableData data] retain];
    }
}




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}


#pragma mark - NSURLConnection

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[responseData appendData:data];
    //NSLog(@"data: %@", responseData);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	
    NSString *htmlString = @"<h2>Network connection failed</h2><p>The web address for this chapter of the Bible couldn't be reached for some reason. Make sure you're connected to WiFi or 3G, and try again.</p>";
    [self.bibleTextWebView loadHTMLString:htmlString baseURL:nil];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	
    
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	[responseData release];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"bibleTextHtmlHeader" ofType:@"html"];
    NSFileHandle *readHandle = [NSFileHandle fileHandleForReadingAtPath:path];
    NSString *htmlHeader = [[NSString alloc] initWithData: 
                            [readHandle readDataToEndOfFile] encoding:NSUTF8StringEncoding];

    NSString *htmlString = [NSString stringWithFormat:@"%@%@</body></html>", htmlHeader, responseString];
    NSURL *mainBundleURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    [self.bibleTextWebView loadHTMLString:htmlString baseURL:mainBundleURL];
    
    
    self.title = biblePassages;
    [activityIndicator stopAnimating];
    
    // Initialise the font change buttons up in the top right
	segmentedButton = [[UISegmentedControl alloc] initWithItems:nil];
	[segmentedButton insertSegmentWithTitle:@"A-" atIndex:0 animated:NO];
	[segmentedButton insertSegmentWithTitle:@"A+" atIndex:1 animated:NO];
	segmentedButton.tintColor = [UIColor darkGrayColor];
	segmentedButton.segmentedControlStyle = UISegmentedControlStyleBar;
	[segmentedButton addTarget:self action:@selector(changeTextFontSize:) forControlEvents:UIControlEventValueChanged]; 

	segmentedButtonBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedButton];
	segmentedButtonBarButtonItem.target = self;
	
    self.navigationItem.rightBarButtonItem = segmentedButtonBarButtonItem;	
    [segmentedButton release];
    [segmentedButtonBarButtonItem release];

    
    [connection release];
    [responseString release];
    [htmlHeader release];
}



- (IBAction)changeTextFontSize:(id)sender
{
    int index = segmentedButton.selectedSegmentIndex; 
	switch (index) {
        case 0: // A-
            textFontSize = (textFontSize > 50) ? textFontSize-5 : textFontSize;
            break;
        case 1: // A+
            textFontSize = (textFontSize < 160) ? textFontSize+5 : textFontSize;
            break;
        default:
            return;    
    }
    
    
    NSString *jsString = [[NSString alloc] initWithFormat:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '%i%%'", textFontSize];
    [bibleTextWebView stringByEvaluatingJavaScriptFromString:jsString];
    [jsString release];
    segmentedButton.selectedSegmentIndex = -1;
}



- (void)dealloc
{
    [bibleTextWebView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


@end