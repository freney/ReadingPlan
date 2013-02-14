//
//  InterfaceDetails.m
//  Reading Plan
//
//  Created by Sam Freney on 26/09/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "InterfaceDetails.h"

@implementation InterfaceDetails

+(UIColor *) colorCellBackground { 
    return [UIColor colorWithRed:0.90 green:0.95 blue:1.0 alpha:1.0]; 
}
+(UIColor *) colorTextRead { 
    return [UIColor grayColor]; 
}
+(UIColor *) colorTextUnread { 
    return [UIColor blackColor]; 
}
@end
