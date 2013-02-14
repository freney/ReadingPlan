//
//  DataSourceHorner.m
//  ReadingPlan
//
//  Created by Sam Freney on 3/01/12.
//  Copyright (c) 2012 Sam Freney. All rights reserved.
//

#import "DataSourceHorner.h"

@implementation DataSourceHorner


+ (NSNumber *)gospelsChapters { return [NSNumber numberWithInt:(28 + 16 + 24 + 21)]; }
+ (NSArray *)gospelsData
{
    static NSArray *data = nil;
    if (!data) {
        
        NSArray *books = [NSArray arrayWithObjects:@"Matthew", @"Mark", @"Luke", @"John", nil];
        NSArray *chapters = [NSArray arrayWithObjects:
                             [NSNumber numberWithInt:28],   // Matthew
                             [NSNumber numberWithInt:16],   // Mark
                             [NSNumber numberWithInt:24],   // Luke
                             [NSNumber numberWithInt:21],   // John
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}


+ (NSNumber *)torahChapters { 
    NSNumber *chapters = [NSNumber numberWithInt:(50 + 40 + 27 + 36 + 34)];
    return chapters;
}
+ (NSArray *)torahData
{
    static NSArray *data = nil;
    if (!data) {
        NSArray *books = [NSArray arrayWithObjects:@"Genesis", @"Exodus", @"Leviticus", @"Numbers", @"Deuteronomy", nil];
        NSArray *chapters = [NSArray arrayWithObjects:
                             [NSNumber numberWithInt:50],   // Genesis
                             [NSNumber numberWithInt:40],   // Exodus
                             [NSNumber numberWithInt:27],   // Leviticus
                             [NSNumber numberWithInt:36],   // Numbers
                             [NSNumber numberWithInt:34],   // Deuteronomy
                             nil];        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];        
    }
    return data;
}



+ (NSNumber *)epistlesIChapters { return [NSNumber numberWithInt:(16 + 16 + 13 + 6 + 6 + 4 + 4 + 13)]; }
+ (NSArray *)epistlesIData
{
    static NSArray *data = nil;
    if (!data) {
        
        NSArray *books = [NSArray arrayWithObjects:@"Romans", @"1 Corinthians", @"2 Corinthians", @"Galatians", @"Ephesians", @"Philippians", @"Colossians", @"Hebrews", nil];
        NSArray *chapters = [NSArray arrayWithObjects:
                             [NSNumber numberWithInt:16],   // Romans
                             [NSNumber numberWithInt:16],   // 1 Corinthians
                             [NSNumber numberWithInt:13],   // 2 Corinthians
                             [NSNumber numberWithInt:6],    // Galatians
                             [NSNumber numberWithInt:6],    // Ephesians
                             [NSNumber numberWithInt:4],    // Philippians
                             [NSNumber numberWithInt:4],    // Colossians
                             [NSNumber numberWithInt:13],   // Hebrews
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}

+ (NSNumber *)epistlesIIChapters { return [NSNumber numberWithInt:(5 + 3 + 6 + 4 + 3 + 1 + 5 + 5 + 3 + 5 + 1 + 1 + 1 + 22)]; }
+ (NSArray *)epistlesIIData
{
    static NSArray *data = nil;
    if (!data) {
        
        NSArray *books = [NSArray arrayWithObjects:@"1 Thessalonians", @"2 Thessalonians", @"1 Timothy", @"2 Timothy", @"Titus", @"Philemon", @"James", @"1 Peter", @"2 Peter", @"1 John", @"2 John", @"3 John", @"Jude", @"Revelation", nil];
        NSArray *chapters = [NSArray arrayWithObjects:
                             [NSNumber numberWithInt:5],    // 1 Thessalonians
                             [NSNumber numberWithInt:3],    // 2 Thessalonians
                             [NSNumber numberWithInt:6],    // 1 Timothy
                             [NSNumber numberWithInt:4],    // 2 Timothy
                             [NSNumber numberWithInt:3],    // Titus
                             [NSNumber numberWithInt:1],    // Philemon
                             [NSNumber numberWithInt:5],    // James
                             [NSNumber numberWithInt:5],    // 1 Peter
                             [NSNumber numberWithInt:3],    // 2 Peter
                             [NSNumber numberWithInt:5],    // 1 John
                             [NSNumber numberWithInt:1],    // 2 John
                             [NSNumber numberWithInt:1],    // 3 John
                             [NSNumber numberWithInt:1],    // Jude
                             [NSNumber numberWithInt:22],   // Revelation
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}


+ (NSNumber *)wisdomChapters { return [NSNumber numberWithInt:(42 + 12 + 8)]; }
+ (NSArray *)wisdomData
{
    static NSArray *data = nil;
    if (!data) {
        
        NSArray *books = [NSArray arrayWithObjects:@"Job", @"Ecclesiastes", @"Song of Songs", nil];
        NSArray *chapters = [NSArray arrayWithObjects:
                             [NSNumber numberWithInt:42],   // Job
                             [NSNumber numberWithInt:12],   // Ecclesiastes
                             [NSNumber numberWithInt:8],    // Song of Songs
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}

+ (NSNumber *)psalmsChapters { return [NSNumber numberWithInt:(150)]; }
+ (NSArray *)psalmsData
{
    static NSArray *data = nil;
    if (!data) {
        
        NSArray *books = [NSArray arrayWithObjects:@"Psalm", nil];
        NSArray *chapters = [NSArray arrayWithObjects:[NSNumber numberWithInt:150], 
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}


+ (NSNumber *)proverbsChapters { return [NSNumber numberWithInt:(31)]; }
+ (NSArray *)proverbsData
{
    static NSArray *data = nil;
    if (!data) {
        
        NSArray *books = [NSArray arrayWithObjects:@"Proverbs", nil];
        NSArray *chapters = [NSArray arrayWithObjects:[NSNumber numberWithInt:31], 
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}



+ (NSNumber *)historyChapters { return [NSNumber numberWithInt:(24 + 21 + 4 + 31 + 24 + 22 + 25 + 29 + 36 + 10 + 13 + 10)]; }
+ (NSArray *)historyData
{
    static NSArray *data = nil;
    if (!data) {        
        NSArray *books = [NSArray arrayWithObjects:@"Joshua", @"Judges", @"Ruth", @"1 Samuel", @"2 Samuel", @"1 Kings", @"2 Kings", @"1 Chronicles", @"2 Chronicles", @"Ezra", @"Nehemiah", @"Esther", nil];
        NSArray *chapters = [NSArray arrayWithObjects:
                             [NSNumber numberWithInt:24],   // Joshua
                             [NSNumber numberWithInt:21],   // Judges
                             [NSNumber numberWithInt:4],    // Ruth
                             [NSNumber numberWithInt:31],   // 1 Samuel
                             [NSNumber numberWithInt:24],   // 2 Samuel
                             [NSNumber numberWithInt:22],   // 1 Kings
                             [NSNumber numberWithInt:25],   // 2 Kings
                             [NSNumber numberWithInt:29],   // 1 Chronicles
                             [NSNumber numberWithInt:36],   // 2 Chronicles
                             [NSNumber numberWithInt:10],   // Ezra
                             [NSNumber numberWithInt:13],   // Nehemiah
                             [NSNumber numberWithInt:10],   // Esther
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}

+ (NSNumber *)prophetsChapters { return [NSNumber numberWithInt:(66 + 52 + 48 + 14 + 3 + 9 + 1 + 4 + 7 + 3 + 3 + 3 + 2 + 14 + 4 + 5 + 12)]; }
+ (NSArray *)prophetsData
{
    static NSArray *data = nil;
    if (!data) {
        
        NSArray *books = [NSArray arrayWithObjects:@"Isaiah", @"Jeremiah", @"Ezekiel", @"Hosea", @"Joel", @"Amos", @"Obadiah", @"Jonah", @"Micah", @"Nahum", @"Habakkuk", @"Zephaniah", @"Haggai", @"Zechariah", @"Malachi", @"Lamentations", @"Daniel", nil];
        NSArray *chapters = [NSArray arrayWithObjects:
                             [NSNumber numberWithInt:66],   // Isaiah
                             [NSNumber numberWithInt:52],   // Jeremiah
                             [NSNumber numberWithInt:48],   // Ezekiel
                             [NSNumber numberWithInt:14],   // Hosea
                             [NSNumber numberWithInt:3],    // Joel
                             [NSNumber numberWithInt:9],    // Amos
                             [NSNumber numberWithInt:1],    // Obadiah
                             [NSNumber numberWithInt:4],    // Jonah
                             [NSNumber numberWithInt:7],    // Micah
                             [NSNumber numberWithInt:3],    // Nahum
                             [NSNumber numberWithInt:3],    // Habakkuk
                             [NSNumber numberWithInt:3],    // Zephaniah
                             [NSNumber numberWithInt:2],    // Haggai
                             [NSNumber numberWithInt:14],   // Zechariah
                             [NSNumber numberWithInt:4],    // Malachi
                             [NSNumber numberWithInt:5],    // Lamentations
                             [NSNumber numberWithInt:12],   // Daniel
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}



+ (NSNumber *)actsChapters { return [NSNumber numberWithInt:(28)]; }
+ (NSArray *)actsData
{
    static NSArray *data = nil;
    if (!data) {
        
        NSArray *books = [NSArray arrayWithObjects:@"Acts", nil];
        NSArray *chapters = [NSArray arrayWithObjects:[NSNumber numberWithInt:28], 
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}



@end
