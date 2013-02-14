//
//  RootViewController.m
//  Reading Plan
//
//  Created by Samuel Freney on 10/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "DataSource.h"
#import "DataSourceHorner.h"
#import "InterfaceDetails.h"
#import "InfoViewController.h"

@implementation RootViewController
@synthesize dayNumber, readIndicies;


enum tableIndexes {
    SKFTorahIndex = 0,
    SKFHistoryIndex = 1,
    SKFMajorProphetsIndex = 2,
    SKFMinorProphetsIndex = 3,
    SKFPsalmsIndex = 4,
    SKFWritingsIndex = 5,
    SKFGospelsIndex = 6,
    SKFActsRomansIndex = 7,
    SKFPaulIndex = 8,
    SKFEpistlesIndex = 9
};


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if ([prefs objectForKey:@"schema"] == nil) {
        [prefs setObject:@"freney" forKey:@"schema"];
    }
    if ([prefs objectForKey:@"bibleLookup"] == nil) {
        [prefs setObject:[NSNumber numberWithBool:TRUE] forKey:@"bibleLookup"];
    }
    if ([prefs objectForKey:@"progressNumbers"] == nil) {
        [prefs setObject:[NSNumber numberWithBool:FALSE] forKey:@"progressNumbers"];
    }
    [prefs synchronize];
    
    self.readIndicies = [prefs objectForKey:@"readIndicies"];
    if ([self.readIndicies count] != 10) {
        self.readIndicies = [NSMutableArray arrayWithObjects:[NSNumber numberWithBool:FALSE], [NSNumber numberWithBool:FALSE], [NSNumber numberWithBool:FALSE], [NSNumber numberWithBool:FALSE], [NSNumber numberWithBool:FALSE], [NSNumber numberWithBool:FALSE], [NSNumber numberWithBool:FALSE], [NSNumber numberWithBool:FALSE], [NSNumber numberWithBool:FALSE], [NSNumber numberWithBool:FALSE], nil];
    }
    [prefs setObject:readIndicies forKey:@"readIndicies"];

    self.dayNumber = [prefs objectForKey:@"dayNumber"];
	if ([dayNumber intValue] < 1) {
		self.dayNumber = [NSNumber numberWithInt:1];
	}
    [prefs setObject:dayNumber forKey:@"dayNumber"];
	[prefs synchronize];
        
    
    UIButton *infoDarkButtonType = [[UIButton buttonWithType:UIButtonTypeInfoLight] retain];
	infoDarkButtonType.frame = CGRectMake(0.0, 0.0, 25.0, 25.0);
	infoDarkButtonType.backgroundColor = [UIColor clearColor];
	[infoDarkButtonType addTarget:self action:@selector(infoButtonPressed) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *infoButton = [[UIBarButtonItem alloc] initWithCustomView:infoDarkButtonType];
	self.navigationItem.rightBarButtonItem = infoButton;
	[infoDarkButtonType release];
	[infoButton release];

    
    // Initialise the up/down buttons up in the top left
	segmentedButton = [[UISegmentedControl alloc] initWithItems:nil];
	[segmentedButton insertSegmentWithImage:[UIImage imageNamed:@"leftArrow.png"] atIndex:0 animated:NO];
	[segmentedButton insertSegmentWithImage:[UIImage imageNamed:@"rightArrow.png"] atIndex:1 animated:NO];
	segmentedButton.tintColor = [UIColor darkGrayColor];
	segmentedButton.segmentedControlStyle = UISegmentedControlStyleBar;
	[segmentedButton addTarget:self action:@selector(findNextSet) forControlEvents:UIControlEventValueChanged]; 
	
	segmentedButtonBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedButton];
	segmentedButtonBarButtonItem.target = self;
	
    self.navigationItem.leftBarButtonItem = segmentedButtonBarButtonItem;	
    [segmentedButton release];
    [segmentedButtonBarButtonItem release];
    
	
	self.title = [NSString stringWithFormat:@"Set %i", [self.dayNumber intValue]];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}



#pragma mark Data Source Methods
- (void)findNextSet {
	int index = segmentedButton.selectedSegmentIndex; 
	if (index == -1) { 
		return;
	}
	
    if (index == 0) { 
	    [self decrementDay];
    } else if (index == 1) { 
		[self incrementDay];
    }		
	segmentedButton.selectedSegmentIndex = -1;
}


#pragma mark - Custom day functions

- (IBAction)incrementDay
{
    NSNumber *nextDay = [NSNumber numberWithInt:[dayNumber intValue]+1];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	[prefs setObject:nextDay forKey:@"dayNumber"];
    self.readIndicies = [NSMutableArray arrayWithObjects:[NSNumber numberWithBool:FALSE], 
                         [NSNumber numberWithBool:FALSE], 
                         [NSNumber numberWithBool:FALSE], 
                         [NSNumber numberWithBool:FALSE], 
                         [NSNumber numberWithBool:FALSE], 
                         [NSNumber numberWithBool:FALSE], 
                         [NSNumber numberWithBool:FALSE], 
                         [NSNumber numberWithBool:FALSE], 
                         [NSNumber numberWithBool:FALSE], 
                         [NSNumber numberWithBool:FALSE], nil];
    [prefs setObject:readIndicies forKey:@"readIndicies"];
	[prefs synchronize];

    [self changeDayValue:nextDay];
}
- (IBAction)decrementDay
{
    if ([dayNumber intValue] <= 1) return;
    NSNumber *prevDay = [NSNumber numberWithInt:[dayNumber intValue]-1];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	[prefs setObject:prevDay forKey:@"dayNumber"];
    self.readIndicies = [NSMutableArray arrayWithObjects:[NSNumber numberWithBool:TRUE], 
                         [NSNumber numberWithBool:TRUE], 
                         [NSNumber numberWithBool:TRUE], 
                         [NSNumber numberWithBool:TRUE], 
                         [NSNumber numberWithBool:TRUE], 
                         [NSNumber numberWithBool:TRUE], 
                         [NSNumber numberWithBool:TRUE], 
                         [NSNumber numberWithBool:TRUE], 
                         [NSNumber numberWithBool:TRUE], 
                         [NSNumber numberWithBool:TRUE], nil];
    [prefs setObject:readIndicies forKey:@"readIndicies"];
	[prefs synchronize];
    
    [self changeDayValue:prevDay];
}

- (void)changeDayValue:(NSNumber *)day
{
    // Set the current selections in user preferences
    self.dayNumber = day;
	    
    self.title = [NSString stringWithFormat:@"Set %@", dayNumber];
    [self.tableView reloadData];
}

- (NSString *)chapterOfTheDay:(NSNumber *)day fromBiblicalSection:(NSArray *)section withChapters:(NSNumber *)totalChapters
{
    int dayRelative = ([day intValue]-1) % [totalChapters intValue];
    int currentBookChapters = 0;
    int bookIndex = 0;
    
    for (int k = 0; k < [[section objectAtIndex:1] count]; k++) {
        bookIndex = k;
        currentBookChapters = [[[section objectAtIndex:1] objectAtIndex:k] intValue];
        
        if (currentBookChapters > dayRelative) break;
        
        dayRelative = dayRelative - currentBookChapters;        
    }
    
    return [NSString stringWithFormat:@"%@ %i", [[section objectAtIndex:0] objectAtIndex:bookIndex], dayRelative+1];
    
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSArray *data = nil;
    NSNumber *chapterNumber = nil;
    NSString *sectionTitle = @"";
    NSString *chapter = @"";
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14.0];
    cell.detailTextLabel.textAlignment = UITextAlignmentLeft;
    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"schema"] isEqualToString:@"horner"]) {        // HORNER READING PLAN
        switch (indexPath.row) {
            case SKFTorahIndex:
                data = [DataSourceHorner gospelsData];
                chapterNumber = [DataSourceHorner gospelsChapters];
                sectionTitle = @"Gospels";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFHistoryIndex:
                data = [DataSourceHorner torahData];
                chapterNumber = [DataSourceHorner torahChapters];
                sectionTitle = @"Torah";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFMajorProphetsIndex:
                data = [DataSourceHorner epistlesIData];
                chapterNumber = [DataSourceHorner epistlesIChapters];
                sectionTitle = @"Epistles I";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFMinorProphetsIndex:
                data = [DataSourceHorner epistlesIIData];
                chapterNumber = [DataSourceHorner epistlesIIChapters];
                sectionTitle = @"Epistles II";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFPsalmsIndex:
                data = [DataSourceHorner wisdomData];
                chapterNumber = [DataSourceHorner wisdomChapters];
                sectionTitle = @"Wisdom";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFWritingsIndex:
                data = [DataSourceHorner psalmsData];
                chapterNumber = [DataSourceHorner psalmsChapters];
                sectionTitle = @"Psalms";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFGospelsIndex:
                data = [DataSourceHorner proverbsData];
                chapterNumber = [DataSourceHorner proverbsChapters];
                sectionTitle = @"Proverbs";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFActsRomansIndex:
                data = [DataSourceHorner historyData];
                chapterNumber = [DataSourceHorner historyChapters];
                sectionTitle = @"History";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFPaulIndex:
                data = [DataSourceHorner prophetsData];
                chapterNumber = [DataSourceHorner prophetsChapters];
                sectionTitle = @"Prophets";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFEpistlesIndex:
                data = [DataSourceHorner actsData];
                chapterNumber = [DataSourceHorner actsChapters];
                sectionTitle = @"Acts";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
        }
    }
    else {
        switch (indexPath.row) {                        // FRENEY READING PLAN
            case SKFTorahIndex:
                data = [DataSource torahData];
                chapterNumber = [DataSource torahChapters];
                sectionTitle = @"Torah";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFHistoryIndex:
                data = [DataSource historyData];
                chapterNumber = [DataSource historyChapters];
                sectionTitle = @"Deut. History";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFMajorProphetsIndex:
                data = [DataSource majorProphetsData];
                chapterNumber = [DataSource majorProphetsChapters];
                sectionTitle = @"Major Prophets";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFMinorProphetsIndex:
                data = [DataSource minorProphetsData];
                chapterNumber = [DataSource minorProphetsChapters];
                sectionTitle = @"Minor Prophets";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFPsalmsIndex:
                data = [DataSource psalmsData];
                chapterNumber = [DataSource psalmsChapters];
                sectionTitle = @"Psalms";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFWritingsIndex:
                data = [DataSource writingsData];
                chapterNumber = [DataSource writingsChapters];
                sectionTitle = @"The Writings";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFGospelsIndex:
                data = [DataSource gospelsData];
                chapterNumber = [DataSource gospelsChapters];
                sectionTitle = @"Gospels";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFActsRomansIndex:
                data = [DataSource actsRomansData];
                chapterNumber = [DataSource actsRomansChapters];
                sectionTitle = @"Acts & Romans";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFPaulIndex:
                data = [DataSource paulData];
                chapterNumber = [DataSource paulChapters];
                sectionTitle = @"Paul";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
                
            case SKFEpistlesIndex:
                data = [DataSource epistlesData];
                chapterNumber = [DataSource epistlesChapters];
                sectionTitle = @"Epistles";
                chapter = [self chapterOfTheDay:dayNumber fromBiblicalSection:data withChapters:chapterNumber];
                break;
        }
    }
    
    if ([[defaults objectForKey:@"progressNumbers"] boolValue]) {
    
        int progress = [dayNumber intValue]%[chapterNumber intValue];
        progress = (progress == 0) ? [chapterNumber intValue] : progress;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%i/%@)", sectionTitle, progress, chapterNumber];
    }
    else cell.detailTextLabel.text = sectionTitle;
    cell.textLabel.text = chapter;

    return cell;

}


- (void)changeAppearanceOfCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([[self.readIndicies objectAtIndex:indexPath.row] boolValue]) {
        [cell setBackgroundColor:[InterfaceDetails colorCellBackground]];
        cell.textLabel.textColor = [InterfaceDetails colorTextRead];
        cell.detailTextLabel.textColor = [InterfaceDetails colorTextRead];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        [cell setBackgroundColor:[UIColor clearColor]];
        cell.textLabel.textColor = [InterfaceDetails colorTextUnread];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self changeAppearanceOfCell:cell forRowAtIndexPath:indexPath];
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Don't fire if it's an editing swipe.
    if (self.editing) return;
    
    // Do nothing if lookup is turned off in preferences; set to true if absent.
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if (![[prefs objectForKey:@"bibleLookup"] boolValue]) return;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:self.title style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    [backButton release];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *string = cell.textLabel.text;
    
    
    BiblicalTextViewController *controller = [[BiblicalTextViewController alloc] initWithNibName:@"BiblicalTextView" bundle:nil];
    controller.biblePassages = string;
    
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    //[self presentModalViewController:controller animated:YES];
    [[self navigationController] pushViewController:controller animated:YES];
    [self.readIndicies replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:TRUE]];
    [controller release];
}




// Swipe to mark as read
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    bool newValue = ![[self.readIndicies objectAtIndex:indexPath.row] boolValue];
    [self.readIndicies replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:newValue]];        
    [self changeAppearanceOfCell:cell forRowAtIndexPath:indexPath];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:readIndicies forKey:@"readIndicies"];
	[prefs synchronize];
    
    return UITableViewCellEditingStyleNone;
    //return UITableViewCellEditingStyleDelete;
}





- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *) indexPath {
    return;
}



- (void)biblicalTextViewControllerDidFinish:(BiblicalTextViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}




#pragma mark Info Button
- (void)infoButtonPressed {
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:self.title style:UIBarButtonItemStylePlain target:nil action:nil];

    // Create and push an InfoView controller.
    InfoViewController *infoViewController = [[InfoViewController alloc] initWithNibName:@"InfoView" bundle:nil];
    
    infoViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [[self navigationController] pushViewController:infoViewController animated:YES];
    
	//InfoViewController *infoViewController = [[InfoViewController alloc] initWithStyle:UITableViewStyleGrouped];
	//[self.navigationController pushViewController:infoViewController animated:YES];
	[infoViewController release];
}


#pragma mark Memory Management
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];


    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    //self.readIndicies = nil;
    //self.dayNumber = nil;

}

- (void)dealloc
{
    [super dealloc];
    [dayNumber release];
    [readIndicies release];
}

@end
