//
//  DataSourceHorner.h
//  ReadingPlan
//
//  Created by Sam Freney on 3/01/12.
//  Copyright (c) 2012 Sam Freney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSourceHorner : NSObject {

}

+ (NSNumber *)gospelsChapters;
+ (NSArray *)gospelsData;

+ (NSNumber *)torahChapters;
+ (NSArray *)torahData;

+ (NSNumber *)epistlesIChapters;
+ (NSArray *)epistlesIData;

+ (NSNumber *)epistlesIIChapters;
+ (NSArray *)epistlesIIData;

+ (NSNumber *)wisdomChapters;
+ (NSArray *)wisdomData;

+ (NSNumber *)psalmsChapters;
+ (NSArray *)psalmsData;

+ (NSNumber *)proverbsChapters;
+ (NSArray *)proverbsData;

+ (NSNumber *)historyChapters;
+ (NSArray *)historyData;

+ (NSNumber *)prophetsChapters;
+ (NSArray *)prophetsData;

+ (NSNumber *)actsChapters;
+ (NSArray *)actsData;



@end