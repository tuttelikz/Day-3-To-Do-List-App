//
//  DisplayTaskViewController.h
//  Day 3 To Do List App
//
//  Created by Sanzhar Askaruly on 6/11/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Foundation/Foundation.h"
#import "Task.h"

@protocol DisplayTaskViewControllerDelegate <NSObject>
-(void)didEditTask: (Task *) task;


@end
@interface DisplayTaskViewController : UIViewController 
@property (weak) id<DisplayTaskViewControllerDelegate> delegate;
@property (strong, nonatomic) Task *task;

@end
