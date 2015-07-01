//
//  Task.h
//  Day 3 To Do List App
//
//  Created by Sanzhar Askaruly on 6/11/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define TASK_TITLE @"tasktitle"
#define TASK_DESCR @"taskdescr"
#define TASK_DATE @"taskdate"
#define TASK_COMPLETION @"taskcompletion"
#define TASK_OBJECTS_KEY @"taskobjectskey"
#define TASK_IMAGE @"image"


@interface Task : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *descr;
@property (strong, nonatomic) NSDate *date;
@property (nonatomic) BOOL isCompleted;
@property (strong, nonatomic) UIImage *image;
-(id) initWithData: (NSDictionary *)data;

@end
