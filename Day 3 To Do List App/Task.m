//
//  Task.m
//  Day 3 To Do List App
//
//  Created by Sanzhar Askaruly on 6/11/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import "Task.h"
#import "DisplayTaskViewController.h"


@implementation Task
-(id)initWithData:(NSDictionary *)data
{
    self = [super init];
    
    if (self) {
        self.title = data[TASK_TITLE];
        self.descr = data[TASK_DESCR];
        self.date = data[TASK_DATE];
        self.isCompleted = [data[TASK_COMPLETION] boolValue];
        self.image = data[TASK_IMAGE];
    }
    return self;
}

@end
