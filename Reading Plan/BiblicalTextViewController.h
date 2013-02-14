//
//  BiblicalTextViewController.h
//  Reading Plan
//
//  Created by Samuel Freney on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BiblicalTextViewController : UIViewController {

    IBOutlet UIWebView *bibleTextWebView;
    UIBarButtonItem *activityIndicatorBarButtonItem;
    UIActivityIndicatorView *activityIndicator;
    NSString *biblePassages;
    NSMutableData *responseData;
    
    UISegmentedControl *segmentedButton; 
	UIBarButtonItem *segmentedButtonBarButtonItem;
    int textFontSize;
    
}

@property (nonatomic, retain) UIWebView *bibleTextWebView;
@property (nonatomic, retain) NSString *biblePassages;
//@property (nonatomic, retain) NSMutableData *responseData;


@end

