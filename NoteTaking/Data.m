//
//  Data.m
//  NoteTaking
//
//  Created by Harshal Jethwa on 2014-05-26.
//  Copyright (c) 2014 Harshal Jethwa. All rights reserved.
//

#import "Data.h"

@implementation Data

static NSMutableDictionary *allNotes;
static NSString *currentKey;

+(NSMutableDictionary *) getAllNotes
{
    if (!allNotes) {
        allNotes = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kAllNotes]];
    }
    return allNotes;
}

+(void)setCurrentKey:(NSString *)key
{
    currentKey = key;
}

+(NSString *)getCurrentKey
{
    return currentKey;
}

+(void)setNoteForCurrentKey:(NSString *)note
{
    [self setNote:note forKey:currentKey];
}

+(void)setNote:(NSString *) note forKey:(NSString *)key
{
    [allNotes setObject:note forKey:key];
}

+(void)removeNoteForKey:(NSString *)key
{
    [allNotes removeObjectForKey:key];
}

+(void)saveNotes
{
    [[NSUserDefaults standardUserDefaults] setObject:allNotes forKey:kAllNotes];
}


//Just if you want to use local storage. Initialize dictionary above by creating dicionarywithcontents of file. And in saveNotes [allnotes writetofile file path atomically:YES]
+(NSString *)filePath
{
    NSArray *directories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documents = [directories objectAtIndex:0];
    return [documents stringByAppendingPathComponent:kAllNotes];
}

@end
