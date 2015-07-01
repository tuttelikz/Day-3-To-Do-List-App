//
//  AddTaskViewController.m
//  Day 3 To Do List App
//
//  Created by Sanzhar Askaruly on 6/11/15.
//  Copyright (c) 2015 Sanzhar Askaruly. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (strong, nonatomic) IBOutlet UIDatePicker *deadlineDatePicker;

@end

@implementation AddTaskViewController
- (IBAction)addTaskButtonPressed:(id)sender {
    Task *task = [Task new];
    task.title = self.titleTextField.text;
    task.descr = self.descriptionTextField.text;
    task.date = self.deadlineDatePicker.date;
    task.isCompleted = NO;
    [self.delegate didAddTask:task];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
