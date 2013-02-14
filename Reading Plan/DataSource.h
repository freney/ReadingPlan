//
//  DataSource.h
//  Reading Plan
//
//  Created by Samuel Freney on 9/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataSource : NSObject {
    
}
+ (NSNumber *)torahChapters;
+ (NSNumber *)historyChapters;
+ (NSNumber *)majorProphetsChapters;
+ (NSNumber *)minorProphetsChapters;
+ (NSNumber *)psalmsChapters;
+ (NSNumber *)writingsChapters;
+ (NSNumber *)gospelsChapters;
+ (NSNumber *)actsRomansChapters;
+ (NSNumber *)paulChapters;
+ (NSNumber *)epistlesChapters;

+ (NSArray *)torahData;
+ (NSArray *)historyData;
+ (NSArray *)majorProphetsData;
+ (NSArray *)minorProphetsData;
+ (NSArray *)psalmsData;
+ (NSArray *)writingsData;
+ (NSArray *)gospelsData;
+ (NSArray *)actsRomansData;
+ (NSArray *)paulData;
+ (NSArray *)epistlesData;

@end
