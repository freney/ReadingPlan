//
//  InfoViewController.h
//  Reading Plan
//
//  Created by Sam Freney on 30/09/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController {
    
    IBOutlet UIScrollView *scrollView;
    IBOutlet UISwitch *switchBibleFetch;
    IBOutlet UISwitch *switchProgressNumbers;
    IBOutlet UISegmentedControl *segmentSchema;
    IBOutlet UIView *viewHornerPlanExplanation;
    IBOutlet UIView *viewFreneyPlanExplanation;
    IBOutlet UILabel *labelWhereViewIsInserted;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UISwitch *switchBibleFetch;
@property (nonatomic, retain) IBOutlet UISwitch *switchProgressNumbers;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentSchema;
@property (nonatomic, retain) IBOutlet UIView *viewHornerPlanExplanation;
@property (nonatomic, retain) IBOutlet UIView *viewFreneyPlanExplanation;

- (IBAction)setSchema:(id)sender;
- (IBAction)toggleBibleLookup:(id)sender;

@end

