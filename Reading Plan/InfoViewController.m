//
//  InfoViewController.m
//  Reading Plan
//
//  Created by Sam Freney on 30/09/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "InfoViewController.h"

@implementation InfoViewController
@synthesize segmentSchema, switchBibleFetch, switchProgressNumbers, scrollView, viewFreneyPlanExplanation, viewHornerPlanExplanation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if ([prefs objectForKey:@"bibleLookup"] == nil) {
        [prefs setObject:[NSNumber numberWithBool:TRUE] forKey:@"bibleLookup"];
    }
    if ([prefs objectForKey:@"progressNumbers"] == nil) {
        [prefs setObject:[NSNumber numberWithBool:FALSE] forKey:@"progressNumbers"];
    }
    [prefs synchronize];
    
    switchBibleFetch.on = [[prefs objectForKey:@"bibleLookup"] boolValue];
    switchProgressNumbers.on = [[prefs objectForKey:@"progressNumbers"] boolValue];
    if ([[prefs objectForKey:@"schema"] isEqualToString:@"horner"]) {
        segmentSchema.selectedSegmentIndex = 0;
    }
    else segmentSchema.selectedSegmentIndex = 1;
    
    [self setSchema:nil];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)setSchema:(id)sender {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    [viewFreneyPlanExplanation removeFromSuperview];
    [viewHornerPlanExplanation removeFromSuperview];
        
    int ypos = labelWhereViewIsInserted.frame.origin.y + labelWhereViewIsInserted.frame.size.height;
    
    if (segmentSchema.selectedSegmentIndex == 0) {
        [prefs setObject:@"horner" forKey:@"schema"];
        
        CGRect frame = viewHornerPlanExplanation.frame;
        frame.origin.y = ypos;
        viewHornerPlanExplanation.frame = frame;
        ypos += frame.size.height;
        [scrollView addSubview:viewHornerPlanExplanation];
    }
    else {
        [prefs setObject:@"freney" forKey:@"schema"];
        
        CGRect frame = viewFreneyPlanExplanation.frame;
        frame.origin.y = ypos;
        viewFreneyPlanExplanation.frame = frame;
        ypos += frame.size.height;
        [scrollView addSubview:viewFreneyPlanExplanation];
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, ypos);
    
    [prefs synchronize];

}

- (IBAction)toggleBibleLookup:(id)sender {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:[NSNumber numberWithBool:self.switchBibleFetch.on] forKey:@"bibleLookup"];
    [prefs synchronize];
}

- (IBAction)toggleProgressNumbers:(id)sender {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:[NSNumber numberWithBool:self.switchProgressNumbers.on] forKey:@"progressNumbers"];
    [prefs synchronize];
}

@end
