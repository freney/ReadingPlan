//
//  RootViewController.h
//  Reading Plan
//
//  Created by Samuel Freney on 10/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BiblicalTextViewController.h"

@interface RootViewController : UITableViewController {
    NSNumber *dayNumber;
    IBOutlet UIToolbar *toolBar;
    IBOutlet UIBarButtonItem *toolBarTitle; 
    NSMutableArray *readIndicies;
    
    UISegmentedControl *segmentedButton; 
	UIBarButtonItem *segmentedButtonBarButtonItem;
	
}

@property (nonatomic, retain) NSNumber *dayNumber;
@property (nonatomic, retain) NSMutableArray *readIndicies;


- (IBAction)incrementDay;
- (IBAction)decrementDay;
- (void)changeDayValue:(NSNumber *)day;
- (NSString *)chapterOfTheDay:(NSNumber *)day fromBiblicalSection:(NSArray *)section withChapters:(NSNumber *)totalChapters;


@end
