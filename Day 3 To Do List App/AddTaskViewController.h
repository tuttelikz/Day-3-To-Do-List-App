//
//  AddTaskViewController.h
//  Day 3 To Do List App
//
//  Created by Sanzhar Askaruly on 6/11/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
@protocol AddTaskViewControllerDelegate <NSObject>
-(void) didAddTask: (Task *) task;

@end


@interface AddTaskViewController : UIViewController
@property (weak) id<AddTaskViewControllerDelegate> delegate;

@end
