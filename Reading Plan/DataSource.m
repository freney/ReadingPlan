//
//  DataSource.m
//  Reading Plan
//
//  Created by Samuel Freney on 9/05/11.
//  Copyright 2011 Sam Freney. All rights reserved.
//

#import "DataSource.h"


@implementation DataSource

+ (NSNumber *)torahChapters { 
    NSNumber *chapters = [NSNumber numberWithInt:(50 + 40 + 27 + 36 + 34)];
    return chapters;
}
+ (NSArray *)torahData
{
    static NSArray *data = nil;
    if (!data) {
        NSArray *books = [NSArray arrayWithObjects:@"Genesis", @"Exodus", @"Leviticus", @"Numbers", @"Deuteronomy", nil];
        NSArray *chapters = [NSArray arrayWithObjects:[NSNumber numberWithInt:50], 
                                                      [NSNumber numberWithInt:40],
                                                      [NSNumber numberWithInt:27],
                                                      [NSNumber numberWithInt:36],
                                                      [NSNumber numberWithInt:34],
                                                      nil];        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];        
    }
    return data;
}


+ (NSNumber *)historyChapters { 
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *chapters;
    if ([[defaults objectForKey:@"schema"] isEqualToString:@"horner"]) {
        chapters = [NSNumber numberWithInt:(24 + 21 + 4 + 31 + 24 + 22 + 25)]; 
    }
    else chapters = [NSNumber numberWithInt:(24 + 21 + 4 + 31 + 24 + 22 + 25)]; 
    return chapters;
}
+ (NSArray *)historyData
{
    static NSArray *data = nil;
    if (!data) {        
        NSArray *books = [NSArray arrayWithObjects:@"Joshua", @"Judges", @"Ruth", @"1 Samuel", @"2 Samuel", @"1 Kings", @"2 Kings", nil];
        NSArray *chapters = [NSArray arrayWithObjects:[NSNumber numberWithInt:24], 
                             [NSNumber numberWithInt:21],
                             [NSNumber numberWithInt:4],
                             [NSNumber numberWithInt:31],
                             [NSNumber numberWithInt:24],
                             [NSNumber numberWithInt:22],
                             [NSNumber numberWithInt:25],
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}

+ (NSNumber *)majorProphetsChapters { return [NSNumber numberWithInt:(66 + 52 + 48)]; }
+ (NSArray *)majorProphetsData
{
    static NSArray *data = nil;
    if (!data) {
        
        NSArray *books = [NSArray arrayWithObjects:@"Isaiah", @"Jeremiah", @"Ezekiel", nil];
        NSArray *chapters = [NSArray arrayWithObjects:[NSNumber numberWithInt:66], 
                             [NSNumber numberWithInt:52],
                             [NSNumber numberWithInt:48],
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}

+ (NSNumber *)minorProphetsChapters { return [NSNumber numberWithInt:(14 + 3 + 9 + 1 + 4 + 7 + 3 + 3 + 3 + 2 + 14 + 4 + 5 + 12)]; }
+ (NSArray *)minorProphetsData
{
    static NSArray *data = nil;
    if (!data) {
        
        NSArray *books = [NSArray arrayWithObjects:@"Hosea", @"Joel", @"Amos", @"Obadiah", @"Jonah", @"Micah", @"Nahum", @"Habakkuk", @"Zephaniah", @"Haggai", @"Zechariah", @"Malachi", @"Lamentations", @"Daniel", nil];
        NSArray *chapters = [NSArray arrayWithObjects:[NSNumber numberWithInt:14], 
                             [NSNumber numberWithInt:3],
                             [NSNumber numberWithInt:9],
                             [NSNumber numberWithInt:1],
                             [NSNumber numberWithInt:4],
                             [NSNumber numberWithInt:7],
                             [NSNumber numberWithInt:3],
                             [NSNumber numberWithInt:3],
                             [NSNumber numberWithInt:3],
                             [NSNumber numberWithInt:2],
                             [NSNumber numberWithInt:14],
                             [NSNumber numberWithInt:4],
                             [NSNumber numberWithInt:5],
                             [NSNumber numberWithInt:12],
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

+ (NSNumber *)writingsChapters { return [NSNumber numberWithInt:(42+31+12+8+29+36+10+13+10)]; }
+ (NSArray *)writingsData
{
    static NSArray *data = nil;
    if (!data) {
        
        NSArray *books = [NSArray arrayWithObjects:@"Job", @"Proverbs", @"Ecclesiastes", @"Song of Songs", @"1 Chronicles", @"2 Chronicles", @"Ezra", @"Nehemiah", @"Esther", nil];
        NSArray *chapters = [NSArray arrayWithObjects:[NSNumber numberWithInt:42], 
                             [NSNumber numberWithInt:31],
                             [NSNumber numberWithInt:12],
                             [NSNumber numberWithInt:8],
                             [NSNumber numberWithInt:29],
                             [NSNumber numberWithInt:36],
                             [NSNumber numberWithInt:10],
                             [NSNumber numberWithInt:13],
                             [NSNumber numberWithInt:10],
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}

+ (NSNumber *)gospelsChapters { return [NSNumber numberWithInt:(28+16+24+21)]; }
+ (NSArray *)gospelsData
{
    static NSArray *data = nil;
    if (!data) {
        
        NSArray *books = [NSArray arrayWithObjects:@"Matthew", @"Mark", @"Luke", @"John", nil];
        NSArray *chapters = [NSArray arrayWithObjects:[NSNumber numberWithInt:28], 
                             [NSNumber numberWithInt:16],
                             [NSNumber numberWithInt:24],
                             [NSNumber numberWithInt:21],
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}

+ (NSNumber *)actsRomansChapters { return [NSNumber numberWithInt:(28+16)]; }
+ (NSArray *)actsRomansData
{
    static NSArray *data = nil;
    if (!data) {
        
        NSArray *books = [NSArray arrayWithObjects:@"Acts", @"Romans", nil];
        NSArray *chapters = [NSArray arrayWithObjects:[NSNumber numberWithInt:28], 
                             [NSNumber numberWithInt:16],
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}

+ (NSNumber *)paulChapters { return [NSNumber numberWithInt:(16+13+6+6+4+4+5+3+6+4+3+1)]; }
+ (NSArray *)paulData
{
    static NSArray *data = nil;
    if (!data) {
        
        NSArray *books = [NSArray arrayWithObjects:@"1 Corinthians", @"2 Corinthians", @"Galatians", @"Ephesians", @"Philippians", @"Colossians", @"1 Thessalonians", @"2 Thessalonians", @"1 Timothy", @"2 Timothy", @"Titus", @"Philemon", nil];
        NSArray *chapters = [NSArray arrayWithObjects:[NSNumber numberWithInt:16], 
                             [NSNumber numberWithInt:13],
                             [NSNumber numberWithInt:6],
                             [NSNumber numberWithInt:6],
                             [NSNumber numberWithInt:4],
                             [NSNumber numberWithInt:4],
                             [NSNumber numberWithInt:5],
                             [NSNumber numberWithInt:3],
                             [NSNumber numberWithInt:6],
                             [NSNumber numberWithInt:4],
                             [NSNumber numberWithInt:3],
                             [NSNumber numberWithInt:1],
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}

+ (NSNumber *)epistlesChapters { return [NSNumber numberWithInt:(13+5+5+3+5+1+1+1+22)]; }
+ (NSArray *)epistlesData
{
    static NSArray *data = nil;
    if (!data) {
        
        NSArray *books = [NSArray arrayWithObjects:@"Hebrews", @"James", @"1 Peter", @"2 Peter", @"1 John", @"2 John", @"3 John", @"Jude", @"Revelation", nil];
        NSArray *chapters = [NSArray arrayWithObjects:[NSNumber numberWithInt:13], 
                             [NSNumber numberWithInt:5],
                             [NSNumber numberWithInt:5],
                             [NSNumber numberWithInt:3],
                             [NSNumber numberWithInt:5],
                             [NSNumber numberWithInt:1],
                             [NSNumber numberWithInt:1],
                             [NSNumber numberWithInt:1],
                             [NSNumber numberWithInt:22],
                             nil];
        
        data = [[NSArray arrayWithObjects:books, chapters, nil] retain];
        
    }
    return data;
}


@end
