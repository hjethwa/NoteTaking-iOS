//
//  Data.h
//  NoteTaking
//
//  Created by Harshal Jethwa on 2014-05-26.
//  Copyright (c) 2014 Harshal Jethwa. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDefaultText @"New Note"
#define kAllNotes @"Notes"
#define kDetailView @"showDetail"

@interface Data : NSObject

+(NSMutableDictionary *) getAllNotes;
+(void)setCurrentKey:(NSString *)key;
+(NSString *)getCurrentKey;
+(void)setNoteForCurrentKey:(NSString *)note;
+(void)setNote:(NSString *) note forKey:(NSString *)key;
+(void)removeNoteForKey:(NSString *)key;

+(void)saveNotes;
+(NSString *)filePath;
@end
